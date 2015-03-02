class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients, id: false, primary_key: :name do |t|
      t.string :name, null: false, primary_key: true
    end
  end
end
