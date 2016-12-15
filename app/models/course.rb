class Course < ApplicationRecord

  validates_presence_of :title, :route, message: 'Campo en blanco'

end
