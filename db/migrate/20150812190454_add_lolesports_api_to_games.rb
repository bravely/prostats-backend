class AddLolesportsApiToGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.integer :lolesports_id, index: true
      t.integer :game_length
      t.integer :winner_id
      t.string :legs_url
      t.integer :game_number
      t.string :youtube_url
    end
  end
end
