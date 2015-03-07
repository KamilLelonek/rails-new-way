require_relative 'products/product_entity'
require_relative 'deliveries/delivery_entity'

module OfferRequests
  class OfferRequestEntity
    include ::Virtus.model

    attribute :id, String
    attribute :delivery_id,     String, default: :default_delivery_id
    attribute :delivery,        Deliveries::DeliveryEntity
    attribute :customer_name,   String
    attribute :customer_email,  String
    attribute :company_name,    String
    attribute :company_phone,   String
    attribute :company_address, String
    attribute :products,        Array[Products::ProductEntity]

    private
    def default_delivery_id
      delivery.id if delivery.present?
    end
  end
end
