# frozen_string_literal: true

class ApiController < ActionController::API
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session
  before_action :authenticate_user_from_token! # Must come after protect_from_forgery.

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  private

  def authenticate_user_from_token!
    warden.authenticate!(:token_authenticatable, store: false)
  end

  def not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
