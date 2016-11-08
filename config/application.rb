require_relative 'boot'

require 'rails/all'
require 'dotenv'

Bundler.require(*Rails.groups)

puts 'Loading Enviroment variables'
Dotenv::Railtie.load

module Eul
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
