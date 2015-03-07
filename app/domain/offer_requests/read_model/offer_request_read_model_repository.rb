module OfferRequests
  module ReadModel
    class OfferRequestReadModelRepository
      include Common::Repository

      ReadModelVersion     = 1
      ReadModelVersionFrom = '2015-02-17T00:00:00+01:00'

      def initialize(orm_adapter = OfferRequestReadModel)
        super
      end

      def save(offer_request)
        adapter
          .create!(
            version:      ReadModelVersion,
            version_from: ReadModelVersionFrom,
            dump:         offer_request.as_json
          )
      end
    end
  end
end
