# frozen_string_literal: true

module Models
  class Product < BaseModel
    attribute :name, Types::String
    attribute :stores, Types::Array.of(Store).optional.default([].freeze)
  end
end
