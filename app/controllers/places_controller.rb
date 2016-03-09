class PlacesController < ApplicationController

  def index

    @places = Place.all

  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save!
      redirect_to @place, notice: 'place was successfully added.'

    else
      render :new
    end
  end
def edit
  @place = Place.find(params[:id])
end
def update
  @place = Place.find(params[:id])
  if @place.update(place_params)
    redirect_to places_path, notice: 'Place details updated.'
  else
    redirect_to edit_place_path

  end
end
  def destroy
  end


end

def place_params
  params.require(:place).permit(:place_name, :location_id, :category_id, :address, :photo, :short_description, :contact_number, :contact_person)
end
