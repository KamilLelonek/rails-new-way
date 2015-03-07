module Common
  module Query
    def initialize(repository, mapper)
      @repository = repository
      @mapper     = mapper
    end

    def load_all
      repository.all.map { |record| mapper.(record) }
    end

    def load_one(id, error)
      mapper.call(
        repository.find_by(id: id).tap do |record|
          raise error, "Could not found record with id #{id}" if record.nil?
        end
      )
    end

    private
    attr_reader :repository, :mapper
  end

end
