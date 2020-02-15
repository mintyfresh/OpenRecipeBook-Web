# frozen_string_literal: true

module Repositories
  module Features
    module Update
      include Save

      # @param object [Models::BaseModel]
      # @param attributes [Hash]
      # @return [Models::BaseModel]
      def update(object, attributes)
        raise ArgumentError, "#{object.inspect} is not a #{model.name}." unless object.is_a?(model)

        new_object = model.rebuild(object, attributes)
        save(new_object)

        new_object
      end
    end
  end
end
