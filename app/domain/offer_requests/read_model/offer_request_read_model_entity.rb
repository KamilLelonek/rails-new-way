module OfferRequests
  module ReadModel
    class OfferRequestReadModelEntity
      include ::Virtus.model

      attribute :id,           String
      attribute :version,      Integer
      attribute :version_from, DateTime
      attribute :created_at,   DateTime
      attribute :dump,         Hash
    end
  end
end
