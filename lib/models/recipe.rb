# frozen_string_literal: true

module Models
  class Recipe < BaseModel
    attribute :id, Types::String.optional.default(nil)
    attribute :name, Types::String
    attribute :servings, Types::String.optional.default(nil)
    attribute :cooktime, Types::String.optional.default(nil)
    attribute :preptime, Types::String.optional.default(nil)

    attribute :equipment,   Types::Array.of(RecipeEquipment).optional.default([].freeze)
    attribute :ingredients, Types::Array.of(RecipeIngredient).optional.default([].freeze)
    attribute :directions,  Types::Array.of(RecipeDirection).optional.default([].freeze)
    attribute :tags,        Types::Array.of(Types::String).optional.default([].freeze)
  end
end
