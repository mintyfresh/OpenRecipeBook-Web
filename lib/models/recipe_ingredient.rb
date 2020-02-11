# frozen_string_literal: true

module Models
  class RecipeIngredient < BaseModel
    attribute :name, Types::StrippedString
    attribute :quantity, Types::Quantity.optional.default(nil)
    attribute :link, Types::NonEmptyString.default(nil)

    # @return [RecipeIngredient]
    def self.empty
      new(name: '')
    end

    # @return [Hash]
    def serializable_hash
      { 'name'     => name,
        'quantity' => quantity,
        'link'     => link }
        .compact
    end
  end
end
