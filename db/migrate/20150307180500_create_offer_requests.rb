class CreateOfferRequests < ActiveRecord::Migration
  def change
    create_table :offer_requests, id: :uuid do |t|
      t.string  :customer_name,   null: false
      t.string  :customer_email,  null: false
      t.string  :company_name,    null: false
      t.string  :company_phone,   null: false
      t.string  :company_address, null: false
      t.uuid    :delivery_id,     null: false
      t.timestamps                null: false
    end

    add_foreign_key :offer_requests, :deliveries
    add_index       :offer_requests, :delivery_id
  end
end
