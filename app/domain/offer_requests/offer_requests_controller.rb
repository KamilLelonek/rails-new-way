module OfferRequests
  class OfferRequestsController < ApplicationController
    def index
      render json: get_all_offer_requests.load_all
    end

    def create
      create_offer_request.run(params).match do
        success do
          head :created
        end

        failure do |exception|
          render json: exception, status: :unprocessable_entity
        end
      end
    end

    private
    def get_all_offer_requests
      ReadModel::GetAllOfferRequestReadModels.new
    end

    def create_offer_request
    UseCases::MakeOfferRequest
    end
  end
end
