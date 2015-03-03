class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, id: :uuid do |t|
      t.string  :name,        null: false
      t.integer :oz_capacity, null: false
    end
  end
end
