require 'test_helper'

class Api::V1::VotersControllerTest < ActionController::TestCase
  test "can create voter" do
    assert_difference('Voter.count') do
      post :create, voter:{ name: "Bill", party: "Democrat"}
    end
  end

  test "voter has access token" do
    voter = Voter.create(name: "Bill")
    assert voter.access_token
  end

  # test "user without token cannot update voter information" do
  #   patch :update, id: 1, voter: {name: "Bill Smith"}
  #   assert_equal "Bill", Voter.find(1).name
  # end

  test "voter with token can update their own information" do
    voter = Voter.create(name: "Bill")
    patch :update, id: voter.id, access_token: voter.access_token, voter: {name: "Bill Smith"}
    assert_equal "Bill Smith", Voter.last.name
  end

  test "voters can only have one vote" do
    voter= Voter.find(1)
    assert_difference('Vote.count', 1) do
      vote= Vote.create(voter_id: 1, candidate_id: 1)
      vote= Vote.create(voter_id: 1, candidate_id: 1)
    end
  end
end
