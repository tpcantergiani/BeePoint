class Api::V1::VehiclesController < ApplicationController
    before_action :check_vehicle, :check_waypoint
    skip_before_action :verify_authenticity_token

    def gps
        latitude = is_float(params["latitude"])
        longitude = is_float(params["longitude"])
        sentAt =  is_date(params["sent_at"])
         waypoint = @vehicle.waypoints.create!(latitude:latitude, longitude:longitude, sentAt: sentAt)
        render json: waypoint, status: :created
    end

    private

    def check_vehicle
        plate = params["vehicle_identifier"]
        @vehicle = Vehicle.find_or_create_by(identifier: plate)
    end

    def check_waypoint
        isLatFloat = params["latitude"] and is_float(params["latitude"]) 
        isLongFloat = params["longitude"] and is_float(params["longitude"]) 
        isSentAtDate =  params["sent_at"] and is_date(params["sent_at"])
        
        # Se podria agregar una verificacion del 
        # identificador del vehiculo
        
        if (!isLatFloat or !isLongFloat or !isSentAtDate)
            render json: params, status: 400
        end

    end

    ## Estas funciones podrian ir en algun alguna carpeta utils:

    def is_float(i)
        (not i.to_f.to_s == i)
    end

    def is_date(date)
        ((DateTime.parse(date) rescue ArgumentError) == ArgumentError)
    end

end
