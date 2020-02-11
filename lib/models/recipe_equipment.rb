# frozen_string_literal: true

module Models
  class RecipeEquipment < BaseModel
    attribute :name, Types::String
    attribute :note, Types::String.optional.default(nil)
  end
end
