class AddLolesportsApiToLeagues < ActiveRecord::Migration
  def change
    change_table :leagues do |t|
      t.integer :lolesports_id, index: true
    end
  end
end
