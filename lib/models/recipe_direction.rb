# frozen_string_literal: true

module Models
  class RecipeDirection < BaseModel
    attribute :step, Types::StrippedString.optional
    attribute :note, Types::NonEmptyString.default(nil)

    # @return [RecipeDirection]
    def self.empty
      new(step: '')
    end

    # @return [Hash]
    def serializable_hash
      { 'step' => step,
        'note' => note }
        .compact
    end
  end
end
