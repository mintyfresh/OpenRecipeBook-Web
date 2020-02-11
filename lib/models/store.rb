# frozen_string_literal: true

module Models
  class Store < BaseModel
    attribute :name, Types::String
    attribute :note, Types::String.optional.default('')
  end
end
