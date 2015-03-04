class Api::V1::VotesController < ApplicationController
  before_filter :restrict_access, only: [:create]

  def index
    votes= Vote.all
    render json: votes
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

  def voter_params
    params.require(:voter).permit(:name, :party)
  end
end
