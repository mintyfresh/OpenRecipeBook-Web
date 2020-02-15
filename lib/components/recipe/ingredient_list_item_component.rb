# frozen_string_literal: true

module Components
  module Recipe
    class IngredientListItemComponent < BaseComponent
      option :ingredient
      option :index, default: -> { nil }

      # @return [String]
      def id
        index && "id=\"ingredient-#{index}\""
      end

      self.template = <<~HTML
        <li <%== id %>>
          <%= ingredient.quantity %>
          <a href="<%= ingredient.link || '#' %>">
            <%= ingredient.name %>
          </a>
        </li>
      HTML
    end
  end
end
