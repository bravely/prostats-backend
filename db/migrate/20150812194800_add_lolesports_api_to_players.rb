class AddLolesportsApiToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.remove :real_name

      t.string :first_name
      t.string :last_name
      t.boolean :starter
      t.string :hometown
      t.datetime :contract_expires_at
      t.string :residency
      t.string :facebook_url
      t.string :twitter_url
    end
  end
end
