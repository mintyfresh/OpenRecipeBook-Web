# frozen_string_literal: true

module Repositories
  class RecipeRepository < BaseRepository
    self.model     = Models::Recipe
    self.directory = :recipes

    include Features::All
    include Features::Find
    include Features::Save
    include Features::Delete
  end
end
