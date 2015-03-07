class InMemoryAdapter
  attr_accessor :all

  def initialize
    @all = []
  end

  def create!(record)
    all << dummy_record(record)
    all.last
  end

  def find_by(params)
    all.find { |record| record.send(params.keys.first) == params.values.first }
  end

  private
  def dummy_record(record)
    OpenStruct.new(record.merge!(id: SecureRandom.uuid))
  end
end
