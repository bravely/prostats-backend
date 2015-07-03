class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :handle, index: true
      t.string :real_name
      t.integer :position
      t.integer :season_wins
      t.integer :season_losses

      t.timestamps null: false
    end
  end
end
