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
    #binding.pry

    city = City.create(name: params[:barbershop][:city])
    state = State.create(long_name: params[:barbershop][:state])
    zip_code = ZipCode.create(zip: params[:barbershop][:zip_code])
    place_info = PlaceInfo.create(placeID: params[:barbershop][:placeID], the_type: params[:barbershop][:type])
    address = Address.create(street1: params[:barbershop][:street1], street2: params[:barbershop][:street2],
                          city_id: city.id, zip_code_id: zip_code.id, state_id: state.id)
    barbershop = Barbershop.new(name: params[:barbershop][:name], address_id: address.id, place_info_id: place_info.id, isEthnic: params[:barbershop][:isEthnic])

    if barbershop.save
      render json: barbershop.id, status: :ok
    else
      render status: :bad_request
    end

  end

  def show
    render json: Barbershop.find_by(id: params[:id]), status: :ok
  end

end
