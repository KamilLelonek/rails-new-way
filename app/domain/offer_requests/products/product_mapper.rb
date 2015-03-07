require_relative '../../juices/categories/category_mapper'

module OfferRequests
  module Products
    class ProductMapper
      def call(record)
        Products::ProductEntity.new(
          id:       record.id,
          quantity: record.quantity,
          category: map_category(record),
        )
      end

      def map_category(record)
        Juices::Categories::CategoryMapper.new.(record.category)
      end
    end
  end
end
