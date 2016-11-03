class User < ApplicationRecord
  has_secure_password

  belongs_to :user_type

  validates_presence_of :name, message: "campo nombre en blanco"
  validates_presence_of :lastname, message: "campo apellido en blanco"
  validates_presence_of :document, message: "campo cédula de identidad en blanco"
  validates_presence_of :phone, message: "campo teléfono en blanco"
  validates_presence_of :email, message: "campo email en blanco"
  validates_presence_of :password, message: "campo password en blanco"
  validates_presence_of :user_type, message: "campo tipo en blanco"

  validates_uniqueness_of :email, message: "email ya existe"
  validates_uniqueness_of :phone, message: "teléfono ya existe"
  validates_uniqueness_of :document, message: "documento de identidad ya existe"

  validates_format_of :email, with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Formato de correo no válido"
  validates_format_of :name, with:  /\A([a-z A-Z]*)\Z/i, message: "Nombre solo debe contener letras", on: :update
  validates_format_of :lastname, with:  /\A([a-z A-Z]*)\Z/i, message: "Apellido solo debe contener letras", on: :update

end
