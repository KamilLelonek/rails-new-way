module Common
  module Repository
    def initialize(adapter)
      @adapter = adapter
    end

    delegate :all, :find_by, :where, to: :adapter

    private
    attr_reader :adapter
  end
end
