class UserType < ApplicationRecord
  has_many :users

  validates_uniqueness_of :title, message: "Dato ya existe"
end
