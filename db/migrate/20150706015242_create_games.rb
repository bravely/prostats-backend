class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :played_at, index: true
      t.text :notes
      t.string :youtube_picks
      t.string :youtube_start
      t.string :twitch_picks
      t.string :twitch_start
      t.belongs_to :blue_team, index: true
      t.belongs_to :red_team, index: true
      t.belongs_to :league, index: true

      t.timestamps null: false
    end

    create_table :plays do |t|
      t.belongs_to :player, index: true, foreign_key: true
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
