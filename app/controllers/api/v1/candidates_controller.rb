class Api::V1::CandidatesController < ApplicationController

  def index
    candidates= Candidate.all
    render json: candidates
  end

  def show
    candidate = Candidate.find(params[:id])
    render json: candidate
  end
end
