# frozen_string_literal: true

class Api::V1::VehiclesController < ApplicationController
  before_action :check_vehicle, :check_waypoint
  skip_before_action :verify_authenticity_token

  def gps
    latitude = is_float(params['latitude'])
    longitude = is_float(params['longitude'])
    sentAt =  is_date(params['sent_at'])
    waypoint = @vehicle.waypoints.create!(latitude: latitude, longitude: longitude, sentAt: sentAt)
    render json: waypoint, status: :created
  end

  private

  def check_vehicle
    plate = params['vehicle_identifier']
    @vehicle = Vehicle.find_or_create_by(identifier: plate)
  end

  #TODO: dimsinuir complejidad ciclomatica

  def check_waypoint
    is_lat_float = (params['latitude'] && float?(params['latitude']))
    is_long_float = (params['longitude'] && float?(params['longitude']))
    is_sent_date = (params['sent_at'] && date?(params['sent_at']))

    # Se podria agregar una verificacion del
    # identificador del vehiculo

    if !is_lat_float || !is_long_float || !is_sent_date
      render json: params, status: :bad_request
    end
  end

  ## Estas funciones podrian ir en algun alguna carpeta utils:

  def float?(word)
    (word.to_f.to_s != word)
  end

  def date?(date)
    ((begin
          DateTime.parse(date)
      rescue StandardError
        ArgumentError
        end) == ArgumentError)
  end
end
