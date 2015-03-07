module OfferRequests
  class OfferRequestsController < ApplicationController
    def index
      render json: get_all_offer_requests.load_all
    end

    private
    def get_all_offer_requests
      ReadModel::GetAllOfferRequestReadModels.new
    end
  end
end
