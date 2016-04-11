class LandmarksController < ApplicationController

  def index
    @landmarks = Landmark.all.order(:created_at)
  end

  def new
    @landmark = Landmark.new
  end

  def create
    @landmark = Landmark.new(landmark_params)
    @landmark.user = current_user

    if @landmark.save
      redirect_to root_path, notice: "Food Landmark successfully created."
    else
      render :new
    end
  end


  private

    def landmark_params
      params.require(:landmark).permit(:photo, :caption, :location, :address, :user_id)
    end


end
