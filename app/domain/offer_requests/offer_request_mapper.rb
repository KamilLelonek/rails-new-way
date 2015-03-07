module OfferRequests
  class OfferRequestMapper
    def call(record)
      OfferRequestEntity.new(
        id:              record.id,
        delivery:        map_delivery(record),
        customer_name:   record.customer_name,
        customer_email:  record.customer_email,
        company_name:    record.company_name,
        company_phone:   record.company_phone,
        company_address: record.company_address,
        products:        map_products(record)
      )
    end

    def map_delivery(record)
      Deliveries::DeliveryMapper.new.(record.delivery)
    end

    def map_products(record)
      record.products.map &method(:map_product)
    end

    def map_product(product)
      Products::ProductMapper.new.(product)
    end
  end
end
