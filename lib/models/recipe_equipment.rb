# frozen_string_literal: true

module Models
  class RecipeEquipment < BaseModel
    attribute :name, Types::StrippedString.optional
    attribute :link, Types::NonEmptyString.default(nil)

    # @return [RecipeEquipment]
    def self.empty
      new(name: '')
    end

    # @return [Hash]
    def serializable_hash
      { 'name' => name,
        'link' => link }
        .compact
    end
  end
end
