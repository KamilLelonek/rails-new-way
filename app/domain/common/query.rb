module Common
  module Query
    def initialize(repository)
      @repository = repository
    end

    def call
      repository.all
    end

    private
    attr_reader :repository
  end

end
