# frozen_string_literal: true

module Models
  class RecipeDirection < BaseModel
    attribute :step, Types::String
    attribute :note, Types::String.optional.default(nil)
  end
end
