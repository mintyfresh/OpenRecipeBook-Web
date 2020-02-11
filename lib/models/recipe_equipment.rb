# frozen_string_literal: true

module Models
  class RecipeEquipment < BaseModel
    attribute :name, Types::String
    attribute :link, Types::String.optional.default(nil)
  end
end
