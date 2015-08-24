class AddLolesportsApiToPlays < ActiveRecord::Migration
  def change
    change_table :plays do |t|
      t.integer :kills
      t.integer :deaths
      t.integer :assists
      t.decimal :kda
      t.integer :champion_id
      t.integer :end_level
      t.integer :total_gold
      t.integer :minions_killed
      t.integer :first_spell
      t.integer :second_spell

      t.integer :item0
      t.integer :item1
      t.integer :item2
      t.integer :item3
      t.integer :item4
      t.integer :item5
    end
  end
end
