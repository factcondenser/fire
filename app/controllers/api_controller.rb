# frozen_string_literal: true

class ApiController < ActionController::API
  include ActionController::RequestForgeryProtection

  before_action :authenticate_user!
end
