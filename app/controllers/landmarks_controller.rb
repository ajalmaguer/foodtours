class LandmarksController < ApplicationController
  before_action(:set_landmark, only: [:show, :edit, :update, :destroy, :add_tour])
  before_action(:get_tours, only: [:show, :new, :edit, :update])
  before_action(:authorize, except: [:index, :show])
  before_action(:only_my_landmark, only: [:edit, :update, :destroy])

  def index
    @landmarks = Landmark.all.order(:created_at)
  end

  def show
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

  def edit
  end

  def update
    if @landmark.update_attributes(landmark_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @landmark.destroy
    redirect_to root_path
  end

  def add_tour
    @landmark.tours << Tour.find(params[:tour][:tour_id])
    redirect_to root_path
  end


  private
    def set_landmark
      @landmark = Landmark.find(params[:id])
    end

    def get_tours
      @user_tours = Tour.where(:user => current_user)
      # loop through user tours (@tours)
        # for each tour loop through landmark tours, and chec
        @available_tours = []
        @user_tours.each do |tour|
          begin
            tour.landmarks.find(params[:id])
          rescue
            @available_tours << tour
          end
        end

    end

    def landmark_params
      params.require(:landmark).permit(:photo, :caption, :location, :address, :user_id)
    end

    def only_my_landmark
      if current_user != @landmark.user
        redirect_to root_path, notice: "You can only edit your own landmarks."
      end
    end


end
