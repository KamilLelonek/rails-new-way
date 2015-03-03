class InsertCategories < ActiveRecord::Migration
  CATEGORIES = [
    {
      name:        'short',
      oz_capacity: 8
    },
    {
      name:        'tall',
      oz_capacity: 12
    },
    {
      name:        'grande',
      oz_capacity: 16
    },
  ]

  def up
    execute "INSERT INTO categories VALUES #{categories}"
  end

  def down
    execute 'TRUNCATE TABLE categories'
  end

  private
  def categories
    CATEGORIES.map { |category| "(uuid_generate_v4(), '#{category[:name]}', '#{category[:oz_capacity]}')," }.join.chop
  end
end
