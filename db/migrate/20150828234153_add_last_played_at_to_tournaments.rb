class AddLastPlayedAtToTournaments < ActiveRecord::Migration
  def up
    add_column :tournaments, :last_played_at, :datetime
    add_index :tournaments, :last_played_at

    Tournament.find_each do |tournament|
      tournament.last_played_at = Match.where(tournament_id: tournament.id, finished: true)
        .order(played_at: :desc).first.try(:played_at)
      tournament.save!
    end
  end

  def down
    remove_column :tournaments, :last_played_at
  end
end
