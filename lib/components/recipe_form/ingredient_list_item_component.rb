# frozen_string_literal: true

module Components
  module RecipeForm
    class IngredientListItemComponent < BaseComponent
      self.template_file = root.join('recipe_form', 'ingredient_list_item_component.erb')

      option :ingredient
      option :ingredient_options
      option :errors, default: -> { {} }
    end
  end
end
