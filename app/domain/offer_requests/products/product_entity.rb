require_relative '../../juices/categories/category_entity'

module OfferRequests
  module Products
    class ProductEntity
      include ::Virtus.model

      attribute :id, String
      attribute :category_id,    String, default: :default_category_id
      attribute :juice_category, Juices::Categories::CategoryEntity
      attribute :quantity,       Integer

      private
      def default_category_id
        juice_category.id if juice_category.present?
      end
    end
  end
end
