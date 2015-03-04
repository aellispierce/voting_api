class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def restrict_access
    voter = Voter.find_by_access_token(params[:access_token])
    head :unauthorized unless voter
  end
end
