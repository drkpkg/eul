class ApiController < ApplicationController

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
end
