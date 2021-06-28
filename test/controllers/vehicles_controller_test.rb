# frozen_string_literal: true

require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get /show" do
    get '/show'
    assert_response :success
    assert_not_nil assigns(:waypoints)
  end
end
