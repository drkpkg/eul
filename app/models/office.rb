class Office < ApplicationRecord

  validates_presence_of :lat, :lon, :description, message: "Campo en blanco"
end
