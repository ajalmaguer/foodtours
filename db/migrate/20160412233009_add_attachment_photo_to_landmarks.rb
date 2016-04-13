class AddAttachmentPhotoToLandmarks < ActiveRecord::Migration
  def self.up
    change_table :landmarks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :landmarks, :photo
  end
end
