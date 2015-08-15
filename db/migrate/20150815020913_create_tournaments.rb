class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :name
      t.boolean :finished
      t.belongs_to :league, index: true

      t.timestamps null: false
    end
  end
end
