class Address < ActiveRecord::Base
  has_many(:barbershops)
end
