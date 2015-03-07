module OfferRequests
  module ReadModel
    class OfferRequestReadModelMapper
      def call(record)
        OfferRequestReadModelEntity.new(
          id:           record.id,
          version:      record.version,
          version_from: record.version_from,
          created_at:   record.created_at,
          dump:         record.dump
        )
      end
    end
  end
end
