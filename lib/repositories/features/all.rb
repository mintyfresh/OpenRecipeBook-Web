# frozen_string_literal: true

module Repositories
  module Features
    module All
      # @param lazy [Boolean]
      # @return [Array<Models::BaseModel>]
      def all(lazy: false)
        files = Dir[directory.join('**/*.yml')]
        files = files.lazy if lazy

        files.map do |filepath|
          data = read_file(filepath)
          id   = extract_id_from_filepath(filepath)

          model.new(data.merge(id: id))
        end
      end

    private

      # @param filepath [String]
      # @return [String]
      def extract_id_from_filepath(filepath)
        filepath.gsub(directory.to_path + '/', '').chomp('.yml')
      end
    end
  end
end
