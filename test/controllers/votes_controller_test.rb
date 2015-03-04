require 'test_helper'

class Api::V1::VotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  # test "index should have votes" do
  #   Vote.create(voter_id: 1, candidate_id: 1)
  #   get :index
  #   json = JSON.parse(response.body)
  #   assert_equal 1, json.length
  # end
end
