# frozen_string_literal: true

require 'test_helper'

class Api::V1::VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    post '/api/v1/gps'
    assert_response :created
  end
end
