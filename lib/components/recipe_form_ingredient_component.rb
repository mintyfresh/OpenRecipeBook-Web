# frozen_string_literal: true

module Components
  class RecipeFormIngredientComponent < BaseComponent
    # @param recipe_ingredient [Models::RecipeIngredient]
    # @param ingredient_options [Array<Models::Ingredient>]
    def initialize(recipe_ingredient:, ingredient_options:)
      @recipe_ingredient  = recipe_ingredient
      @ingredient_options = ingredient_options
    end

    self.template = <<~HTML
      <div class="container row">
        <div class="col form-group">
          <label for="recipe[ingredient][][name]">Name:</label>
          <input
            type="text"
            name="recipe[ingredient][][name]"
            class="form-control form-control-sm"
            value="<%= @recipe_ingredient.name %>"
          />
        </div>
        <div class="col form-group">
          <label for="recipe[ingredients][][quantity]">Quantity:</label>
          <input
            type="text"
            name="recipe[ingredients][][quantity]"
            class="form-control form-control-sm"
            value="<%= @recipe_ingredient.quantity %>"
          />
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
