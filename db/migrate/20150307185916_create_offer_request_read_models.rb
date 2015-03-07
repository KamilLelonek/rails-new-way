class CreateOfferRequestReadModels < ActiveRecord::Migration
  def change
    create_table :offer_request_read_models do |t|
      t.jsonb    :dump,         null: false
      t.integer  :version,      null: false
      t.datetime :version_from, null: false
      t.datetime :created_at,   null: false
    end
  end
end
