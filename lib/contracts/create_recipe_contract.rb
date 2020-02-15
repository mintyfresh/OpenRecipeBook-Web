# frozen_string_literal: true

module Contracts
  class CreateRecipeContract < BaseContract
    option :recipe_repository,     default: -> { Repositories::RecipeRepository.new }
    option :equipment_repository,  default: -> { Repositories::EquipmentRepository.new }
    option :ingredient_repository, default: -> { Repositories::IngredientRepository.new }

    params do
      required(:section).filled(:string)
      required(:name).filled(:string)
      required(:servings).filled { str? | float? | int? }
      optional(:preptime).value { str? | float? | int? }
      optional(:cooktime).value { str? | float? | int? }

      optional(:equipment).array do
        hash do
          required(:name).filled(:string)
          optional(:link).value(:string)
        end
      end
      optional(:ingredients).array do
        hash do
          required(:name).filled(:string)
          required(:quantity).filled { str? | float? | int? }
          optional(:link).value(:string)
        end
      end
      optional(:directions).array do
        hash do
          required(:step).filled(:string)
          optional(:note).value(:string)
        end
      end
      optional(:tags).array(:string)
    end

    rule(:section) do
      key.failure('does not exist') unless recipe_repository.sections.include?(value)
    end
  end
end
