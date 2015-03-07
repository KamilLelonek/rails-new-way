module OfferRequests
  module ReadModel
    class GetAllOfferRequestReadModels
      include Common::Query

      def initialize(repository = OfferRequestReadModelRepository.new, mapper = OfferRequestReadModelMapper.new)
        super
      end

      alias_method :call, :load_all
    end
  end
end
