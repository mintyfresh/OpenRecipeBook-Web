# frozen_string_literal: true

module Components
  module Recipe
    class DirectionListItemComponent < BaseComponent
      # @param direction [Array<Models::RecipeDirection>]
      # @param index [Integer, nil]
      def initialize(direction:, index: nil)
        @direction = direction
        @index     = index
      end

      # @return [String]
      def id
        @index && "id=\"direction-#{@index}\""
      end

      self.template = <<~HTML
        <li <%== id %>>
          <%= @direction.step %>
          <% if @direction.note %>
            <br>
            <i><%= @direction.note %></i>
          <% end %>
        </li>
      HTML
    end
  end
end
