module OfferRequests
  class OfferRequest < ActiveRecord::Base
    belongs_to :delivery, class_name: 'Deliveries::Delivery'
    has_many   :products, class_name: 'Products::Product', dependent: :destroy

    accepts_nested_attributes_for :products
  end
end
