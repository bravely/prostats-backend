class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name, index: true
      t.string :region
      t.string :abbr

      t.timestamps null: false
    end

    add_reference :teams, :league, index: true, foreign_key: true
  end
end
