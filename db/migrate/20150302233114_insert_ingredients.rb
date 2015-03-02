class InsertIngredients < ActiveRecord::Migration
  INGREDIENTS = %w(banana apple orange)

  def up
    execute "INSERT INTO ingredients VALUES #{ingredients}"
  end

  def down
    execute 'TRUNCATE TABLE ingredients'
  end

  private
  def ingredients
    INGREDIENTS.map { |ingredient| "('#{ingredient}'),"}.join.chop
  end
end
