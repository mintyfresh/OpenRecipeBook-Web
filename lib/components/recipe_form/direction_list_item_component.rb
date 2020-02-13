# frozen_string_literal: true

module Components
  module RecipeForm
    class DirectionListItemComponent < BaseComponent
      # @param recipe_direction [Models::RecipeDirection]
      def initialize(recipe_direction:)
        @recipe_direction = recipe_direction
      end

      self.template = <<~HTML
        <div class="container row">
          <div class="col form-group">
            <label for="recipe[directions][][step]">Step:</label>
            <textarea name="recipe[directions][][step]" class="form-control"><%= @recipe_direction.step %></textarea>
          </div>
          <div class="col form-group">
            <label for="recipe[directions][][note]">Note:</label>
            <textarea name="recipe[directions][][note]" class="form-control"><%= @recipe_direction.note %></textarea>
          </div>
          <div class="col-auto">
            <label style="display: block">&nbsp;</label>
            <button type="button" class="btn btn-outline-danger" onclick="this.parentElement.parentElement.remove()">
              Remove
            </button>
          </div>
        </div>
      HTML
    end
  end
end
