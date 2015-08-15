class AddLolesportsApiToTeams < ActiveRecord::Migration
  def change
    change_table :teams do |t|
      t.integer :lolesports_id
      t.string :acronym
      t.integer :wins, default: 0
      t.integer :losses, default: 0
    end
  end
end
