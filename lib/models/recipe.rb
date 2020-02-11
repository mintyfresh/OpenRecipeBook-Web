# frozen_string_literal: true

module Models
  class Recipe < BaseModel
    include Features::Identifier

    attribute :name, Types::StrippedString
    attribute :servings, Types::Quantity.optional.default(nil)
    attribute :preptime, Types::NonEmptyString.default(nil)
    attribute :cooktime, Types::NonEmptyString.default(nil)

    attribute :equipment,   Types::Array.of(RecipeEquipment).default([].freeze)
    attribute :ingredients, Types::Array.of(RecipeIngredient).default([].freeze)
    attribute :directions,  Types::Array.of(RecipeDirection).default([].freeze)
    attribute :tags,        Types::Array.of(Types::StrippedString).default([].freeze)

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

    # @return [Hash]
    def serializable_hash
      { 'name'        => name,
        'servings'    => servings,
        'preptime'    => preptime,
        'cooktime'    => cooktime,
        'equipment'   => equipment.map(&:serializable_hash),
        'ingredients' => ingredients.map(&:serializable_hash),
        'directions'  => directions.map(&:serializable_hash),
        'tags'        => tags }
        .compact
    end
  end
end
