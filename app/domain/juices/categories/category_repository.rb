require_relative '../../common/repository'

module Juices
  module Categories
    class CategoryRepository
      include Common::Repository

      def initialize(adapter = Category)
        super
      end
    end
  end
end
