require_relative '../../juices/categories/category_mapper'

module OfferRequests
  module Products
    class ProductMapper
      def call(record)
        Products::ProductEntity.new(
          id:             record.id,
          quantity:       record.quantity,
          juice_category: map_juice_category(record),
        )
      end

      def map_juice_category(record)
        Juices::Categories::CategoryMapper.new.(record.juice_category)
      end
    end
  end
end
