class ToursController < ApplicationController
  before_action(:set_tour, only: [:show, :edit, :update, :destroy])
  before_action(:authorize, except: [:index, :show])
  before_action(:only_my_tour, only: [:edit, :update, :destroy])

  def index
    @tours = Tour.all.order(:name)
  end

  def show
    #@referer is the the page you came from. So that the back button on the tour show page will go back to where you came from.
    @referer = request.referer

    @landmarks = @tour.landmarks

    @hash = Gmaps4rails.build_markers(@landmarks) do |landmark, marker|
      marker.lat landmark.latitude
      marker.lng landmark.longitude
      marker.infowindow   "<strong>#{landmark.caption}</strong> at #{landmark.location} <br>
                           <a href='http://maps.google.com/?q=#{landmark.address}' target='_blank'>Open in google maps</a>"
      marker.title landmark.caption
      marker.json({id: landmark.id})
    end

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
