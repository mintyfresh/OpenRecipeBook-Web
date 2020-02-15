# frozen_string_literal: true

module Components
  module RecipeForm
    class IngredientListItemComponent < BaseComponent
      # @param recipe_ingredient [Models::RecipeIngredient]
      # @param ingredient_options [Array<Models::Ingredient>]
      # @param errors [Hash, nil]
      def initialize(recipe_ingredient:, ingredient_options:, errors: {})
        @recipe_ingredient  = recipe_ingredient
        @ingredient_options = ingredient_options
        @errors             = errors || {}
      end

      self.template = <<~HTML
        <div class="container row">
          <div class="col form-group">
            <%== draw(Components::FormControlComponent,
                      label:  'Name:',
                      name:   'recipe[ingredients][][name]',
                      value:  @recipe_ingredient.name,
                      errors: @errors[:name])
            %>
          </div>
          <div class="col form-group">
            <%== draw(Components::FormControlComponent,
                      label:  'Quantity:',
                      name:   'recipe[ingredients][][quantity]',
                      value:  @recipe_ingredient.quantity,
                      errors: @errors[:quantity])
            %>
          </div>
          <div class="col form-group">
            <label for="recipe[ingredient][][link]">Link:</label>
            <select class="custom-select custom-select-sm" name="recipe[ingredient][][link]">
              <option></option>
              <% @ingredient_options.each do |option| %>
              <option
                value="<%= option.reference %>"
                style="text-transform: capitalize"
                <%= option.reference == @recipe_ingredient.link && 'selected' %>
              >
                <%= option.name %>
              </option>
              <% end %>
            </select>
          </div>
          <div class="col-auto form-group">
            <label style="display: block">&nbsp;</label>
            <button type="button" class="btn btn-sm btn-outline-danger" onclick="this.parentElement.parentElement.remove()">
              Remove
            </button>
          </div>
        </div>
      HTML
    end
  end
end
