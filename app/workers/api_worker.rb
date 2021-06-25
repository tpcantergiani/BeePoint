class ApiWorker
  include Sidekiq::Worker

  def perform(in_lat, in_long, in_time, in_id)
    if check_waypoint(in_lat, in_long, in_time, in_id)
      latitude = in_lat.to_f
      longitude = in_long.to_f
      sent_at =  in_time.to_datetime

      @vehicle = Vehicle.find_or_create_by(identifier: in_id)

      @vehicle.waypoints.create!(
        latitude: latitude,
        longitude: longitude,
        sent_at: sent_at
      )
      stdout "WayPoint Created! =)"
    else
      stdout "WayPoint Information Error =("
    end
  end

  private

  ## Funcion que chequea si los parametros son correctos:
  def check_waypoint(in_lat, in_long, in_time, in_id)
    is_lat_float = float?(in_lat)
    is_long_float = float?(in_long)
    is_sent_date = date?(in_time)

    # Se podria agregar una verificacion del
    # identificador del vehiculo

    if !is_lat_float || !is_long_float || !is_sent_date || !in_id
      return false
    end

    true
  end

  ## Estas funciones podrian ir en algun alguna carpeta utils:

  def float?(word)
    (word.to_f.to_s != word) && word
  end

  def date?(date)
    (begin
          DateTime.parse(date)
     rescue StandardError
       ArgumentError
        end) != ArgumentError
  end
end
