# namespace :lolesports_api do
#   desc 'Please use Process League for now.'
#   task process: :environment do
#   end
#
#   desc 'Processes a League and all sub objects.'
#   task :process_league, [:league_id] do |t, args|
#     api_league = LolesportsApi::League.find(args[0])
#     league = League.find_or_initialize_by(lolesports_id: api_league.id)
#     league.name = api_league.label
#     league.abbr = api_league.short_name
#     league.save
#
#     api_league.league_series.each do |api_series|
#       api_series.reload
#       series = Series.find_or_initialize_by(lolesports_id: api_series.id)
#       series.name = api_series.label
#       series.season = api_series.season
#       series.league = league
#       series.save
#     end
#   end
# end
