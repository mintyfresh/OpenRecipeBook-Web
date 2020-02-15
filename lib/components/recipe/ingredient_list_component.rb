# frozen_string_literal: true

module Components
  module Recipe
    class IngredientListComponent < BaseComponent
      option :ingredients

      self.template = <<~HTML
        <% if ingredients && ingredients.any? %>
        <div id="ingredient-list">
          <h2>Ingredients</h2>
          <ul>
          <% ingredients.each_with_index do |ingredient, index| %>
            <%== draw(Components::Recipe::IngredientListItemComponent, ingredient: ingredient, index: index) %>
          <% end %>
          </ul>
        </div>
        <% end %>
      HTML
    end
  end
end
