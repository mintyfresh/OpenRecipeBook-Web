# frozen_string_literal: true

module Models
  class RecipeIngredient < BaseModel
    attribute :name, Types::String
    attribute :quantity, (Types::Integer | Types::Float | Types::String).optional.default(nil)
    attribute :link, Types::String.optional.default(nil)
  end
end
