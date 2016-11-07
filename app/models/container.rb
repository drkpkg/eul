class Container < ApplicationRecord
  has_many :packages
  
  validates_presence_of :code, message: 'Campo en blanco'
end
