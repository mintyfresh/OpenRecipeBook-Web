# frozen_string_literal: true

module Models
  class Recipe < BaseModel
    include Features::Identifier

    attribute :section, Types::StrippedString
    attribute :name, Types::StrippedString
    attribute :servings, Types::Quantity.optional.default(nil)
    attribute :preptime, Types::NonEmptyString.default(nil)
    attribute :cooktime, Types::NonEmptyString.default(nil)

    attribute :equipment,   Types::Array.of(RecipeEquipment).default([].freeze)
    attribute :ingredients, Types::Array.of(RecipeIngredient).default([].freeze)
    attribute :directions,  Types::Array.of(RecipeDirection).default([].freeze)
    attribute :tags,        Types::Array.of(Types::StrippedString).default([].freeze)

    # @return [Recipe]
    def self.empty
      new(section:     '',
          name:        '',
          equipment:   [RecipeEquipment.empty],
          ingredients: [RecipeIngredient.empty],
          directions:  [RecipeDirection.empty])
    end

    # @param attributes [Hash]
    # @return [Recipe]
    def self.new(attributes)
      if (id = attributes[:id] || attributes['id'])
        section = id.split('/', 2)[0]
        super(attributes.merge(section: section))
      else
        super(attributes)
      end
    end

    # @return [String]
    def generate_identifier
      super(section + '/' + name)
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
