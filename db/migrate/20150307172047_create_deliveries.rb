class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries, id: :uuid do |t|
      t.string  :name,        null: false
      t.text    :descirption, null: false
    end
  end
end
