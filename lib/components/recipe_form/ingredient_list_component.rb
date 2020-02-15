# frozen_string_literal: true

module Components
  module RecipeForm
    class IngredientListComponent < BaseComponent
      option :ingredients
      option :errors,                default: -> { {} }
      option :ingredient_repository, default: -> { Repositories::IngredientRepository.new }

      # @return [Array<Models::Ingredient>]
      def ingredient_options
        @ingredient_options ||= ingredient_repository.all.sort_by(&:name).freeze
      end

      self.template = <<~HTML
        <div id="ingredient-list">
          <label class="h3">Ingredient:</label>
          <% ingredients.each_with_index do |ingredient, index| %>
          <%== draw(Components::RecipeForm::IngredientListItemComponent,
                    ingredient:         ingredient,
                    ingredient_options: ingredient_options,
                    errors:             errors && errors[index])
          %>
          <% end %>
        </div>
        <div id="ingredient-template" style="display: none">
          <%== draw(Components::RecipeForm::IngredientListItemComponent,
                    ingredient:         Models::RecipeIngredient.empty,
                    ingredient_options: ingredient_options) %>
        </div>
      HTML
    end
  end
end
