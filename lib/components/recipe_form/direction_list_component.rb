# frozen_string_literal: true

module Components
  module RecipeForm
    class DirectionListComponent < BaseComponent
      # @param recipe_direction_list [Array<Models::RecipeDirection>]
      # @param errors [Hash, nil]
      def initialize(recipe_direction_list:, errors: {})
        @recipe_direction_list = recipe_direction_list
        @errors                = errors || {}
      end

      self.template = <<~HTML
        <div id="direction-list">
          <label class="h3">Directions:</label>
          <% @recipe_direction_list.each_with_index do |recipe_direction, index| %>
          <%== draw(Components::RecipeForm::DirectionListItemComponent,
                    recipe_direction: recipe_direction,
                    errors:           @errors[index])
          %>
          <% end %>
        </div>
        <div id="direction-template" style="display: none">
          <%== draw(Components::RecipeForm::DirectionListItemComponent,
                    recipe_direction: Models::RecipeDirection.empty)
          %>
        </div>
      HTML
    end
  end
end
