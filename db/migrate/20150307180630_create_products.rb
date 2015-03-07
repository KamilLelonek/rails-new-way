class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: :uuid do |t|
      t.uuid    :offer_request_id,  null: false
      t.uuid    :category_id,       null: false
      t.integer :quantity,          null: false
    end

    add_foreign_key :products, :offer_requests
    add_index       :products, :offer_request_id

    add_foreign_key :products, :categories
    add_index       :products, :category_id
  end
end
