class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :lolesports_id, index: true
      t.datetime :played_at
      t.boolean :live
      t.boolean :finished
      t.integer :max_games
      t.string :name
      t.belongs_to :tournament, index: true, foreign_key: true
      t.integer :winner_id, index: true
      t.belongs_to :blue_team, index: true
      t.belongs_to :red_team, index: true

      t.timestamps null: false
    end

    change_table :games do |t|
      t.belongs_to :match, index: true, foreign_key: true
    end
  end
end
