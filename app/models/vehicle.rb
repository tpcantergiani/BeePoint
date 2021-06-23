# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_many :waypoints, dependent: :destroy
end
