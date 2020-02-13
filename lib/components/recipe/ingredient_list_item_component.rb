# frozen_string_literal: true

module Components
  module Recipe
    class IngredientListItemComponent < BaseComponent
      # @param ingredient [Array<Models::RecipeIngredient>]
      # @param index [Integer, nil]
      def initialize(ingredient:, index: nil)
        @ingredient = ingredient
        @index      = index
      end

      # @return [String]
      def id
        @index && "id=\"ingredient-#{@index}\""
      end

      self.template = <<~HTML
        <li <%== id %>>
          <%= @ingredient.quantity %>
          <a href="<%= @ingredient.link || '#' %>">
            <%= @ingredient.name %>
          </a>
        </li>
      HTML
    end
  end
end
