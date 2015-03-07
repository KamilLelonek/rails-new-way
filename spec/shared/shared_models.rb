class SharedModels
  def deliveries
    @deliveries ||= 3.times.map do
      OfferRequests::Deliveries::DeliveryEntity.new(
        id:          SecureRandom.uuid,
        name:        Faker::Lorem.word,
        description: Faker::Lorem.paragraph,
      )
    end
  end

  def categories
    @categories ||= 10.times.map do
      Juices::Categories::CategoryEntity.new(
        id:          SecureRandom.uuid,
        name:        Faker::Food.fruit.downcase,
        oz_capacity: rand(1..20)
      )
    end
  end
end
