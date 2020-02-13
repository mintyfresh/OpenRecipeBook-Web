# frozen_string_literal: true

module Components
  module Recipe
    class DirectionListComponent < BaseComponent
      # @param directions [Array<Models::RecipeDirection>]
      def initialize(directions:)
        @directions = directions
      end

      self.template = <<~HTML
        <% if @directions && @directions.any? %>
        <div id="direction-list">
          <h2>Directions</h2>
          <ul>
          <% @directions.each_with_index do |direction, index| %>
            <%== draw(Components::Recipe::DirectionListItemComponent, direction: direction, index: index) %>
          <% end %>
          </ul>
        </div>
        <% end %>
      HTML
    end
  end
end
