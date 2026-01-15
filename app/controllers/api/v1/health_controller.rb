# frozen_string_literal: true

module Api
  module V1
    class HealthController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        render json: {
          status: "ok",
          message: "Rails API is running!",
          timestamp: Time.current
        }
      end
    end
  end
end
