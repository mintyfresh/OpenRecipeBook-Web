# frozen_string_literal: true

module Models
  class Product < BaseModel
    attribute :name, Types::StrippedString
    attribute :stores, Types::Array.of(Store).default([].freeze)

    # @return [Hash]
    def serializable_hash
      { 'name'   => name,
        'stores' => stores.map(&:serializable_hash) }
        .compact
    end
  end
end
