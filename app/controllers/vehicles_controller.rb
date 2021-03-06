# frozen_string_literal: true

class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @waypoints = Vehicle.all.map { |v| v.waypoints.last }
    gon.markers = @waypoints.map(&:get_marker)
  end
end
