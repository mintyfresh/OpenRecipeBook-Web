# frozen_string_literal: true

module Repositories
  module Features
    module Save
      # @param object [Models::BaseModel]
      # @return [void]
      def save(object)
        raise ArgumentError, "#{object.inspect} is not a #{model.name}." unless object.is_a?(model)

        object.generate_identifier if object.id.nil?
        write_file(object.id + '.yml', object.to_hash)
      end
    end
  end
end
