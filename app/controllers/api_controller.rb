# frozen_string_literal: true

class ApiController < ActionController::API
  include ActionController::RequestForgeryProtection
end
