# frozen_string_literal: true

module Repositories
  module Features
    module Find
      # @param id [String]
      # @return [Models::BaseModel]
      def find(id)
        data = read_file(id + '.yml')

        model.new(data.merge(id: id))
      end
    end
  end
end
