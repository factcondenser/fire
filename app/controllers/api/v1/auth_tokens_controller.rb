# frozen_string_literal: true

module Api
  module V1
    class AuthTokensController < ApiController
      skip_before_action :authenticate_user_from_token!, only: :create
      before_action :allow_params_authentication!, only: :create
      before_action :authenticate_user!, only: :create

      # POST /api/v1/auth_token
      def create
        render json: UserBlueprint.render(current_user)
      end

      # DELETE /api/v1/auth_token
      def destroy
        current_user.regenerate_auth_token
      end
    end
  end
end
