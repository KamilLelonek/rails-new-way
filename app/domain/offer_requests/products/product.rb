module OfferRequests
  module Products
    class Product < ActiveRecord::Base
      belongs_to :offer_request
      belongs_to :category, class_name: 'Juices::Categories::Category'
    end
  end
end
