# frozen_string_literal: true

class ApiController < ActionController::API
  include ActionController::RequestForgeryProtection

  # TODO: MAKE SURE COOKIES DON'T WORK FOR AUTHENTICATING USERS IN API CONTROLLERS ACTIONS

  # Rails maps this to 422 Unprocessable Entity by default.
  rescue_from ActionController::InvalidAuthenticityToken, with: :forbidden_response
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  protect_from_forgery

  respond_to :json

  private

  def forbidden_response(exception)
    render json: { error: exception.message }, status: :forbidden
  end

  def not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
