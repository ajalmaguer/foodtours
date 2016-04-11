class CreateJoinTableLandmarkTour < ActiveRecord::Migration
  def change
    create_join_table :landmarks, :tours do |t|
      t.index [:landmark_id, :tour_id] #indexing is for optomization
      t.index [:tour_id, :landmark_id]
    end
  end
end
