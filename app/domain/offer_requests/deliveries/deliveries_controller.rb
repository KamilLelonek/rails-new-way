module OfferRequests
  module Deliveries
    class DeliveriesController < ApplicationController
      def index
        render json: get_all_deliveries.load_all
      end

      private
      def get_all_deliveries
        GetAllDeliveries.new
      end
    end
  end
end
