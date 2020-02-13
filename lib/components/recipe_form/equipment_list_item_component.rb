# frozen_string_literal: true

module Components
  module RecipeForm
    class EquipmentListItemComponent < BaseComponent
      # @param recipe_equipment [Models::RecipeEquipment]
      # @param equipment_options [Array<Models::Equipment>]
      def initialize(recipe_equipment:, equipment_options:)
        @recipe_equipment  = recipe_equipment
        @equipment_options = equipment_options
      end

      self.template = <<~HTML
        <div class="container row">
          <div class="col form-group">
            <label for="recipe[equipment][][name]">Name:</label>
            <input
              type="text"
              name="recipe[equipment][][name]"
              class="form-control form-control-sm"
              value="<%= @recipe_equipment.name %>"
            />
          </div>
          <div class="col form-group">
            <label for="recipe[equipment][][link]">Link:</label>
            <select class="custom-select custom-select-sm" name="recipe[equipment][][link]">
              <option></option>
              <% @equipment_options.each do |option| %>
              <option
                value="<%= option.reference %>"
                style="text-transform: capitalize"
                <%= option.reference == @recipe_equipment.link && 'selected' %>
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
