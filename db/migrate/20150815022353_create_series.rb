class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.integer :lolesports_id
      t.string :name
      t.string :season
      t.belongs_to :league, index: true

      t.timestamps null: false
    end

    change_table :tournaments do |t|
      t.belongs_to :series, index: true
    end
  end
end
