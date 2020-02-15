# frozen_string_literal: true

module Components
  module RecipeForm
    class DirectionListComponent < BaseComponent
      option :directions
      option :errors, default: -> { {} }

      self.template = <<~HTML
        <div id="direction-list">
          <label class="h3">Directions:</label>
          <% directions.each_with_index do |direction, index| %>
          <%== draw(Components::RecipeForm::DirectionListItemComponent,
                    direction: direction,
                    errors:    errors && errors[index])
          %>
          <% end %>
        </div>
        <div id="direction-template" style="display: none">
          <%== draw(Components::RecipeForm::DirectionListItemComponent,
                    direction: Models::RecipeDirection.empty)
          %>
        </div>
      HTML
    end
  end
end
