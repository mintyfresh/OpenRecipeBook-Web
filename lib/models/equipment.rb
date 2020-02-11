# frozen_string_literal: true

module Models
  class Equipment < BaseModel
    attribute :id, Types::String.optional.default(nil)
    attribute :name, Types::String
    attribute :products, Types::Array.of(Product).optional.default([].freeze)
  end
end
