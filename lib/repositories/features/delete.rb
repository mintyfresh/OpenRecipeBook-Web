# frozen_string_literal: true

module Repositories
  module Features
    module Delete
      # @param object [Models::BaseModel]
      # @return [void]
      def delete(object)
        raise ArgumentError, "#{object.inspect} is not a #{model.name}." unless object.is_a?(model)

        delete_file(ingredient.id + '.yml')
      end
    end
  end
end
