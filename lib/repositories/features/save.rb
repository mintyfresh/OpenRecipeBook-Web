# frozen_string_literal: true

module Repositories
  module Features
    module Save
      # @param object [Models::BaseModel]
      # @return [void]
      def save(object)
        raise ArgumentError, "#{object.inspect} is not a #{model.name}." unless object.is_a?(model)

        object.generate_identifier if object.id.nil?
        file_name = object.id + '.yml'
        file_data = object.serializable_hash

        write_file(file_name, file_data)
      end
    end
  end
end
