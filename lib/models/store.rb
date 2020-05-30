# frozen_string_literal: true

module Models
  class Store < BaseModel
    attribute :name, Types::StrippedString
    attribute :link, Types::NonEmptyString.default(nil)

    # @return [Store]
    def self.empty
      new(name: '', link: nil)
    end

    # @return [Hash]
    def serializable_hash
      { 'name' => name,
        'link' => link }
        .compact
    end
  end
end
