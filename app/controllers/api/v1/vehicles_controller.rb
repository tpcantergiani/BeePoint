# frozen_string_literal: true

class Api::V1::VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def gps
    in_lat  = params["latitude"]
    in_long = params["longitude"]
    in_time = params["sent_at"]
    in_id   = params["vehicle_identifier"]
    ApiWorker.perform_async(in_lat, in_long, in_time, in_id)
    render json: {}, status: :created
  end
end
