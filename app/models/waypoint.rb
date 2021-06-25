# frozen_string_literal: true

class Waypoint < ApplicationRecord
  belongs_to :vehicle

  def get_marker
    {  
      "lat": latitude,  
      "lng": longitude,  
      "picture": {  
        "width":  32,  
        "height": 32
      },
      "infowindow": vehicle.identifier,
    }  
  end
  
end
