class RemovePhotoFromLandmarks < ActiveRecord::Migration
  def change
    remove_column :landmarks, :photo
  end
end
