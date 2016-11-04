class Container < ApplicationRecord
  validates_presence_of :code, message: 'Campo en blanco'
end
