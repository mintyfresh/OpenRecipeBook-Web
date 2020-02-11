# frozen_string_literal: true

module Models
  class Store < BaseModel
    attribute :name, Types::StrippedString
    attribute :note, Types::NonEmptyString.default(nil)

    # @return [Hash]
    def serializable_hash
      { 'name' => name,
        'note' => note }
        .compact
    end
  end
end
