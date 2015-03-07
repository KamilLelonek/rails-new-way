module OfferRequests
  class OfferRequestRepository
    include Common::Repository

    def initialize(orm_adapter = OfferRequest)
      super
    end

    def save(offer_request_form)
      map_record save_offer_request offer_request_form
    end

    private
    def map_record(record)
      OfferRequestMapper.new.(record)
    end

    def save_offer_request(offer_request_form)
      adapter
        .create!(
          delivery_id:         offer_request_form.delivery_id,
          customer_name:       offer_request_form.customer_name,
          customer_email:      offer_request_form.customer_email,
          company_name:        offer_request_form.company_name,
          company_phone:       offer_request_form.company_phone,
          company_address:     offer_request_form.company_address,
          products_attributes: products(offer_request_form)
        )
    end

    def products(offer_request_form)
      offer_request_form.products.map(&:to_hash)
    end
  end
end
