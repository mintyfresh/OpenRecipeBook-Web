# frozen_string_literal: true

module Components
  module RecipeForm
    class DirectionListItemComponent < BaseComponent
      # @param recipe_direction [Models::RecipeDirection]
      # @param errors [Hash, nil]
      def initialize(recipe_direction:, errors: {})
        @recipe_direction = recipe_direction
        @errors           = errors || {}
      end

      self.template = <<~HTML
        <div class="container row">
          <div class="col form-group">
            <%== draw(Components::FormControlComponent,
                      label:  'Step:',
                      type:   'textarea',
                      name:   'recipe[directions][][step]',
                      value:  @recipe_direction.step,
                      errors: @errors[:step])
            %>
          </div>
          <div class="col form-group">
            <%== draw(Components::FormControlComponent,
                      label:  'Note:',
                      type:   'textarea',
                      name:   'recipe[directions][][note]',
                      value:  @recipe_direction.note,
                      errors: @errors[:note])
            %>
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
