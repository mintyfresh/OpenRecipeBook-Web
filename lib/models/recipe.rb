# frozen_string_literal: true

module Models
  class Recipe < BaseModel
    include Features::Identifier

    attribute :name, Types::String
    attribute :servings, (Types::Integer | Types::Float | Types::String).optional.default(nil)
    attribute :cooktime, Types::String.optional.default(nil)
    attribute :preptime, Types::String.optional.default(nil)

    attribute :equipment,   Types::Array.of(RecipeEquipment).optional.default([].freeze)
    attribute :ingredients, Types::Array.of(RecipeIngredient).optional.default([].freeze)
    attribute :directions,  Types::Array.of(RecipeDirection).optional.default([].freeze)
    attribute :tags,        Types::Array.of(Types::String).optional.default([].freeze)

    # @return [String]
    def generate_identifier
      super(name)
    end

    # @return [String, nil]
    def section
      return if id.nil?

      fragments = id.split('/', 2)
      return if fragments.length < 2

      fragments[0]
    end
  end
end
