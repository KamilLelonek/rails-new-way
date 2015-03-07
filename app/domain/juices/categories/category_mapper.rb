module Juices
  module Categories
    class CategoryMapper
      def call(record)
        CategoryEntity.new(
          id:          record.id,
          name:        record.name,
          oz_capacity: record.oz_capacity
        )
      end
    end
  end
end
