# frozen_string_literal: true

module Repositories
  class RecipeRepository < BaseRepository
    self.model     = Models::Recipe
    self.directory = :recipes

    include Features::All
    include Features::Find
    include Features::Create
    include Features::Update
    include Features::Delete

    # @param section [String]
    # @param slug [String]
    # @return [Models::Recipe]
    def find(section, slug)
      super("#{section}/#{slug}")
    end

    # @return [Array<String>]
    def sections
      Dir[directory.join('*')]
        .select(&File.method(:directory?))
        .map do |file_path|
          file_path.gsub(directory.to_path + '/', '')
        end
    end
  end
end
