# frozen_string_literal: true

require 'test_helper'

class WaypointTest < ActiveSupport::TestCase
  test "Waypoints variables cant be Null" do
    assert_raise "NotNullViolation" do
      puts Waypoint.create(
        latitude: nill,
        longitude: nill,
        sent_at: nill
      )
    end
  end

  test "Waypoint.get_marker return dictionary:" do
    marker =  waypoints(:way_two_two)
    assert_equal marker.get_marker.keys, [:lat, :lng, :picture, :infowindow]
    assert_equal marker.get_marker.values, [2.0, 2.0, {:width=>32, :height=>32}, "veh_2"]
  end

  test "Waypoint.Vehicle return the especific waypoint vehicle" do
    vehicle = waypoints(:way_two_one).vehicle
    assert_equal vehicle.id, vehicles(:v_two).id
  end
end
