require 'reform/form/coercion'

module OfferRequests
  class OfferRequestFormObject < ::Reform::Form
    include ::Representable::Coercion

    def initialize
      super(OfferRequestEntity.new)
    end

    properties :delivery_id,
               :customer_email,
               :company_phone,
               :customer_name,
               :company_name,
               :company_address,
               type:      String,
               validates: { presence: true }

    validates_format_of :delivery_id,
                        with: /\A[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89aAbB][a-f0-9]{3}-[a-f0-9]{12}\z/

    validates_format_of :customer_email,
                        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    validates_format_of :company_phone,
                        with: /\A(\+?[0-9]{2})?[\-\s]?[0-9]{2,}[\-\s]?[0-9]{3,}[\-\s]?[0-9]{2,}\Z/

    property :products,
             type:      Array,
             validates: { presence: true }

    collection :products, populate_if_empty: Products::ProductEntity do
      property :category_id,
               type:      String,
               validates: { presence: true }

      property :quantity,
               type:      Integer,
               validates: {
                 presence:     true,
                 numericality: { greater_than: 0 }
               }
    end
  end
end
