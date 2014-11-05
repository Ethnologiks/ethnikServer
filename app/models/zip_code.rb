class ZipCode < ActiveRecord::Base
  has_many(:address)
end
