# frozen_string_literal: true

module Api
  module V1
    class CsrfTokensController < ApiController
      # GET /csrf_tokens/new
      def new
        render json: { csrf_token: form_authenticity_token }
      end
    end
  end
end
