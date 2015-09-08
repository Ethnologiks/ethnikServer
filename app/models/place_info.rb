class PlaceInfo < ActiveRecord::Base
  has_many(:barbershops)
end
