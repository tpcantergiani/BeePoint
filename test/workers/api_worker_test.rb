require 'test_helper'
# class ApiWorkerTest < Minitest::Test
class ApiWorkerTest < ActiveSupport::TestCase
  test "Job in correct queue" do 
    in_lat  = "10.0"
    in_long = "10.0"
    in_time = "2021-06-01 01:01:01"
    in_id   = 'veh_1'
    ApiWorker.perform_async(in_lat, in_long, in_time, in_id)
    assert_equal "default", ApiWorker.queue
    # sleep(1) until Sidekiq::Queues["default"].size == 0 
  end
end
