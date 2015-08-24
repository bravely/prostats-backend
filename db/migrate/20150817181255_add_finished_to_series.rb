class AddFinishedToSeries < ActiveRecord::Migration
  def change
    add_column :series, :finished, :boolean, default: false
  end
end
