# frozen_string_literal: true

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test "Vehicle identifier cant be Null" do
    assert_raise "NotNullViolation" do
      puts Vehicle.create(identifier: nil)
    end
  end

  test "Vehicle identifier chas to be unique" do
    assert_raise "ActiveRecord::RecordNotUnique" do
      assert Vehicle.create(identifier: 1)
      puts assert Vehicle.create(identifier: 1)
    end
  end

  test "Vehicle Waypoints" do
    vehicle = Vehicle.find_by(identifier: 'veh_1')
    assert_equal 2, vehicle.waypoints.length
    assert_equal vehicle.waypoints.last.id, vehicle.waypoints[1].id
  end
end
