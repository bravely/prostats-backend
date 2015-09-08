class AddPlayedAtIndexToMatches < ActiveRecord::Migration
  def change
    add_index :matches, :played_at
  end
end
