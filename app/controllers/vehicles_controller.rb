# frozen_string_literal: true

class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @waypoints = Vehicle.all.map { |v| v.waypoints.last }
    @markers = @waypoints.map{
        |waypoint|
        {  
          "lat": waypoint.latitude,  
          "lng": waypoint.longitude,  
          "picture": {  
            "width":  32,  
            "height": 32
          },  
        }  
    }
  end


end
