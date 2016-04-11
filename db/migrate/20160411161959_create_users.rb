class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :profile_pic
      t.string :tagline
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
