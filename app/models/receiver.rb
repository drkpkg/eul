class Receiver < ApplicationRecord

  validates_uniqueness_of :name, :phone, message: 'Datos duplicados'
  validates_presence_of :name, :phone, :address, message: 'Campo en blanco'

end
