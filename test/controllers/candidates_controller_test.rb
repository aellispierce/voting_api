require 'test_helper'

class Api::V1::CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index should have candidates" do
    Candidate.create(name: "John", party: "Tea Party")
    get :index
    json = JSON.parse(response.body)
    assert_equal 1, json.length
  end
end
