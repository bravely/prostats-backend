class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.integer :lolesports_id, index: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :name
      t.boolean :finished
      t.belongs_to :league, index: true
      t.integer :winner_id, index: true
      t.string :season

      t.timestamps null: false
    end

    create_table :contestants do |t|
      t.belongs_to :tournament, index: true
      t.belongs_to :team, index: true

      t.timestamps null: false
    end
  end
end
