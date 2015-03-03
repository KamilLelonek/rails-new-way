module Juices
  module Categories
    class CategoryEntity
      include ::Virtus.model

      attribute :id,          String
      attribute :name,        String
      attribute :oz_capacity, Integer
    end
  end
end
