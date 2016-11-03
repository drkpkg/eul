class UserType < ApplicationRecord
  has_many :users

  validates_uniqueness_of :title, message: "Dato ya existe"
  validates_presence_of :title, message: "Campo vacío"
end
