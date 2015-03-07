require_relative '../../common/query'

module Juices
  module Categories
    class GetAllCategories
      include Common::Query

      def initialize(repository = CategoryRepository.new)
        super
      end
    end
  end
end
