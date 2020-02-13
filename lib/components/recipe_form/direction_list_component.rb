# frozen_string_literal: true

module Components
  module RecipeForm
    class DirectionListComponent < BaseComponent
      # @param recipe_direction_list [Array<Models::RecipeDirection>]
      def initialize(recipe_direction_list:)
        @recipe_direction_list = recipe_direction_list
      end

      self.template = <<~HTML
        <div id="direction">
          <label class="h3">Directions:</label>
          <% @recipe_direction_list.each do |recipe_direction| %>
          <%== embed(Components::RecipeForm::DirectionComponent,
                    recipe_direction: recipe_direction)
          %>
          <% end %>
        </div>
        <div id="direction-template" style="display: none">
          <%== embed(Components::RecipeForm::DirectionComponent,
                    recipe_direction: Models::RecipeDirection.empty)
          %>
        </div>
      HTML
    end
  end
end
