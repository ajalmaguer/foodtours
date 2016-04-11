class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :photo
      t.string :caption
      t.string :location
      t.string :address
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
