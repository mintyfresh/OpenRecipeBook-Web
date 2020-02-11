# frozen_string_literal: true

module Models
  class Ingredient < BaseModel
    include Features::Identifier

    attribute :name, Types::String
    attribute :products, Types::Array.of(Product).optional.default([].freeze)

    # @return [String]
    def generate_identifier
      super(name)
    end
  end
end
