# frozen_string_literal: true

module Repositories
  class IngredientRepository < BaseRepository
    self.model     = Models::Ingredient
    self.directory = :ingredients

    include Features::All
    include Features::Find
    include Features::Create
    include Features::Update
    include Features::Delete
  end
end
