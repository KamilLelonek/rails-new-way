require_relative '../../common/repository'

module Juices
  module Categories
    class CategoryRepository
      include Repository

      def initialize(adapter = Category)
        super
      end
    end
  end
end
