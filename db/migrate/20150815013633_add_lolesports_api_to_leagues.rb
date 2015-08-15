class AddLolesportsApiToLeagues < ActiveRecord::Migration
  def change
    change_table :leagues do |t|
      t.integer :lolesports_id
    end
  end
end
