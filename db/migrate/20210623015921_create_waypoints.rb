# frozen_string_literal: true

class CreateWaypoints < ActiveRecord::Migration[6.1]
  def change
    create_table :waypoints do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.datetime :sentAt, null: false
      t.timestamps
    end
  end
end
