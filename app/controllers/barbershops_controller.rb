class BarbershopsController < ApplicationController

  def search
    render json: match_barbershops(params[:list_barbershops])
  end

  def match_barbershops(place_ids)
    places = PlaceInfo.where(placeID: place_ids)
    barbershops = []
    places.each do |place|
     barbershops.push(Barbershop.find_by(place_info_id: place.id))
    end
    return barbershops.compact
  end

  def create
    @barbershop = Barbershop.new(params.require(:barbershop).permit(:name, :address, :place_info, :isEthnic))

    if @barbershop.save
      render json: @barbershop.id, status: :ok
    else
      render status: :bad_request
    end
  end

  def show
    render json: Barbershop.find_by(id: params[:id]), status: :ok
  end

end
