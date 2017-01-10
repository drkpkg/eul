class Package < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :receiver, optional: true
  belongs_to :container, optional: true

  validates_presence_of :size, :weight, :value, :user_id, :receiver_id, :conveyance, message: 'Campo en blanco'

  def state_human
    state = ['No enviado', 'Enviado', 'Parado', 'Entregado']
    state[self.state]
  end
end
