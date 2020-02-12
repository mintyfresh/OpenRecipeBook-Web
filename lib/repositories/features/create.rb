# frozen_string_literal: true

module Repositories
  module Features
    module Create
      include Save

      # @param attributes [Hash]
      # @return [Models::BaseModel]
      def create(attributes)
        object = model.new(attributes)
        save(object)

        object
      end
    end
  end
end
