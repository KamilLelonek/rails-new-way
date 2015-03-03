module Repository
  def initialize(adapter)
    @adapter = adapter
  end

  delegate :hello, :all, to: :adapter

  private
  attr_reader :adapter
end
