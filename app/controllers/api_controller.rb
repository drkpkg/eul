class ApiController < ApplicationController

  require 'geokit'
  ##
  # Get the package info for the api use
  # host_url/api/packages/{id}
  # return format: Json
  #
  def package_info
    begin
      @package = Package.find_by(code: params[:code])
      render json: {code: @package.code,
        state: @package.state_human,
        type: @package.fragility_human,
        shipping_date: @package.shipping_date,
        delivery_date: @package.delivery_date,
        observations: @package.observations,
        places: @package.places_human},
        status: :ok
    rescue
      render json: {status: :bad_request}, status: :bad_request
    end
  end

  ##
  # Get the offices for the api use
  # host_url/api/offices
  # return format: Json
  #
  def offices
    offices = Office.select("id, lat, lon, description").all
    render json: offices, status: :ok
  end

  def calculate_minor_distance
    begin
      current_location = Geokit::LatLng.new(params[:location][:lat].to_f, params[:location][:lon].to_f)
      destination = "#{params[:destiny][:lat]}, #{params[:destiny][:lon]}"
      # d = distance current_location, destination
      total = (current_location.distance_to(destination).to_f/1.60934)
      render json: {total: (total*0.01).round(3)}, status: :ok
    rescue
      render json: {total: 0}, status: :ok
    end
  end

  # def distance current_location, destination
  #   v = []
  #   Office.all.each do |current|
  #     v.push({current.id: [current.lat, current.lon]})
  #   end
  #   v.each do |a|
  #
  #   end
  # end

end
