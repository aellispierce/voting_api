class Api::V1::VotesController < ApplicationController
  before_filter :restrict_access, only: [:create]

  def index
    results = Candidate.all.map do |candidate|
      {name: candidate.name, party: candidate.party, total: candidate.votes.count}
    end
    render json: results
  end

  def create
    vote= Voter.new(vote_params)
    if vote.save
      render json: vote
    else
      render json: "Invalid parameters"
    end
  end



  private

  def vote_params
    params.require(:vote).permit(:voter_id, :candidate_id)
  end
end
