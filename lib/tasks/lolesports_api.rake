namespace :lolesports_api do
  desc 'Please use Process League for now.'
  task process: :environment do
  end

  desc 'Processes a League and all sub objects.'
  task :process_league, [:league_id] => [:environment] do |_t, args|
    # Begin League processing
    api_league = LolesportsApi::League.find(args[:league_id])
    league = League.find_by(lolesports_id: api_league.id)

    if league.nil?
      league = League.new(lolesports_id: api_league.id).harvest(api_league)
      puts "Created League #{league.lolesports_id}: #{league.name}"
    else
      league.harvest(api_league)
      puts "Updated League #{league.lolesports_id}: #{league.name}"
    end

    # Begin Series processing
    api_league.league_series.each do |orig_series|
      series = Series.find_by(lolesports_id: orig_series.id)

      next if series.nil?
      api_series = LolesportsApi::Series.find(orig_series.id)
      series = Series.new(lolesports_id: api_series.id).harvest(api_series, league: league)
      puts "Created Series #{series.lolesports_id}: #{series.name}"
    end

    # Begin Tournament processing
    finished_tournaments = Tournament.where(finished: true).pluck(:lolesports_id)
    unfinished_tournaments = api_league.league_tournaments.map(&:id) - finished_tournaments

    unfinished_tournaments.each do |orig_tournament_id|
      tournament = Tournament.find_by(lolesports_id: orig_tournament_id)
      api_tournament = LolesportsApi::Tournament.find(orig_tournament_id)
      if tournament.nil?
        tournament = Tournament.new(lolesports_id: api_tournament.id).harvest(api_tournament, league: league)
        puts '---------------------------------------'
        puts "Created Tournament #{tournament.lolesports_id}: #{tournament.name}"
      else
        tournament.harvest(api_tournament, league: league)
        puts '---------------------------------------'
        puts "Updated Tournament #{tournament.lolesports_id}: #{tournament.name}"
      end

      # Begin Team Processing
      teams = []
      api_tournament.contestants.each do |orig_team|
        api_team = LolesportsApi::Team.find(orig_team.id)
        team = Team.find_by(lolesports_id: orig_team.id)
        if team.nil?
          team = Team.new(lolesports_id: orig_team.id).harvest(api_team, league: league)
          puts "Created Team #{team.lolesports_id}: #{team.name}"
        else
          team.harvest(api_team)
          puts "Updated Team #{team.lolesports_id}: #{team.name}"
        end
        teams << team

        # Begin Player processing
        api_team.roster.each do |orig_player|
          player = Player.find_by(lolesports_id: orig_player.id)
          if player.nil?
            player = Player.new(lolesports_id: orig_player.id).harvest
            puts "Created Player #{player.lolesports_id}: #{player.handle}"
          elsif player.updated_at > 24.hours.ago
            player.harvest
            puts "Updated Player #{player.lolesports_id}: #{player.handle}"
          end

          team.players << player
        end
      end
      tournament.teams = (tournament.teams + teams).uniq
    end
  end
end
