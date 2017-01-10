class Package < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :receiver, optional: true
  belongs_to :container, optional: true

  validates_presence_of :size, :weight, :value, :user_id, :receiver_id, :conveyance, message: 'Campo en blanco'

  def state_human
    state = ['No enviado', 'Enviado', 'Parado', 'Entregado']
    state[self.state]
  end

  def places_human
    places = []
    course = Course.find_by(id: self.course_id)
    course = course.route['r']-[""]
    course.each do |place|
      places << Office.find_by(id: place).description
    end
    return places
  end

  def fragility_human
    return 'Frágil' if self.fragility == true
    return 'Estándar' if self.fragility == false
  end
end
