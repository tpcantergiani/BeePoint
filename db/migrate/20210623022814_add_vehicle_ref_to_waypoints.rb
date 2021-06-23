# frozen_string_literal: true

class AddVehicleRefToWaypoints < ActiveRecord::Migration[6.1]
  def change
    add_reference :waypoints, :vehicle, null: false, foreign_key: true
  end
end
