module Common
  class ExistencePolicy
    takes :repository

    def is_satisfied_by?(object_id)
      repository.find_by(id: object_id).present?
    end
  end
end
