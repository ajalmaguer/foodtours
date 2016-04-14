class ToursController < ApplicationController
  before_action(:set_tour, only: [:show, :edit, :update, :destroy])
  before_action(:authorize, except: [:index, :show])
  before_action(:only_my_tour, only: [:edit, :update, :destroy])

  def index
    @tours = Tour.all.order(:name)
  end

  def show
    p "aldskjflaksdjflaskdfjoaskdfjlaskdfjlasdkjflaskdjf"
    p request.referer
    @referer = request.referer
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user

    if @tour.save
      redirect_to tours_path, notice: "Tour successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tour.update_attributes(tour_params)
      redirect_to tours_path
    else
      render :edit
    end
  end

  def destroy
    @tour.destroy
    redirect_to tours_path
  end

  private
    def set_tour
      @tour = Tour.find(params[:id])
    end

    def tour_params
      params.require(:tour).permit(:name)
    end

    def only_my_tour
      if current_user != @tour.user
        redirect_to tours_path, notice: "You can only edit your own tours."
      end
    end


end
