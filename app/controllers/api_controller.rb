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
      render json: @package, status: :ok
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
    render json: offices, status: :success
  end

  def calculate_minor_distance
    begin
      current_location = Geokit::LatLng.new(params[:location][:lat].to_f, params[:location][:lon].to_f)
      destination = "#{params[:destiny][:lat]}, #{params[:destiny][:lon]}"
      # d = distance current_location, destination
      total = (current_location.distance_to(destination).to_f/1.60934)
      render json: {total: (total*0.01).round(3)}
    rescue
      render json: {total: 0}
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
