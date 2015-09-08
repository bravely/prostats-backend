class AddPositionToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :position, :integer
  end
end
