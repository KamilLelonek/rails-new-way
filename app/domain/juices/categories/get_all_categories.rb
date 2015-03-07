require_relative '../../common/query'

module Juices
  module Categories
    class GetAllCategories
      include Common::Query

      def initialize(repository = CategoryRepository.new, mapper = CategoryMapper.new)
        super
      end
    end
  end
end
