# frozen_string_literal: true

module Components
  module RecipeForm
    class IngredientListComponent < BaseComponent
      # @param recipe_ingredient_list [Array<Models::RecipeIngredient>]
      # @param ingredient_repository [Repositories::IngredientRepository]
      # @param errors [Hash, nil]
      def initialize(recipe_ingredient_list:, ingredient_repository: Repositories::IngredientRepository.new, errors: {})
        @recipe_ingredient_list = recipe_ingredient_list
        @ingredient_repository  = ingredient_repository
        @errors                 = errors || {}
      end

      # @return [Array<Models::Ingredient>]
      def ingredient_options
        @ingredient_options ||= @ingredient_repository.all.sort_by(&:name).freeze
      end

      self.template = <<~HTML
        <div id="ingredient-list">
          <label class="h3">Ingredient:</label>
          <% @recipe_ingredient_list.each_with_index do |recipe_ingredient, index| %>
          <%== draw(Components::RecipeForm::IngredientListItemComponent,
                    recipe_ingredient:  recipe_ingredient,
                    ingredient_options: ingredient_options,
                    errors:             @errors[index])
          %>
          <% end %>
        </div>
        <div id="ingredient-template" style="display: none">
          <%== draw(Components::RecipeForm::IngredientListItemComponent,
                    recipe_ingredient:  Models::RecipeIngredient.empty,
                    ingredient_options: ingredient_options) %>
        </div>
      HTML
    end
  end
end
