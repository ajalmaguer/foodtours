class AddColumnsToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :longitude, :float
    add_column :landmarks, :latitude, :float
  end
end
