class InsertDeliveries < ActiveRecord::Migration
  DELIVERIES = [
    {
      name:        'regular',
      description: 'Delivery within 3 next business days.'
    },
    {
      name:        'express',
      description: 'Delivery by the next business day.'
    },
  ]

  def up
    execute "INSERT INTO deliveries VALUES #{deliveries}"
  end

  def down
    execute 'TRUNCATE TABLE deliveries'
  end

  private
  def deliveries
    DELIVERIES.map { |delivery| "(uuid_generate_v4(), '#{delivery[:name]}', '#{delivery[:description]}')," }.join.chop
  end
end
