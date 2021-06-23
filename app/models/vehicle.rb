class Vehicle < ApplicationRecord
    has_many :waypoints, dependent: :destroy
end
