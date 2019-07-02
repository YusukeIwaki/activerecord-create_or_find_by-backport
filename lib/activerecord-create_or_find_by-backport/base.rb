require "active_record"
require "active_record/version"

module ActiverecordCreateOrFindByBackport
  module Patch
    def create_or_find_by(attributes, &block)
      transaction(requires_new: true) { create(attributes, &block) }
    rescue ActiveRecord::RecordNotUnique
      find_by!(attributes)
    end

    def create_or_find_by!(attributes, &block)
      transaction(requires_new: true) { create!(attributes, &block) }
    rescue ActiveRecord::RecordNotUnique
      find_by!(attributes)
    end
  end
end

ActiveRecord::Base.prepend(ActiverecordCreateOrFindByBackport::Patch)
