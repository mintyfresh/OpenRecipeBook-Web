# frozen_string_literal: true

module Components
  class RecipeFormComponent < BaseComponent
    # @param recipe [Models::Recipe]
    # @param equipment_repository [Repositories::EquipmentRepository]
    def initialize(recipe:, sections:)
      @recipe   = recipe
      @sections = sections
    end

    # @return [String]
    def http_action
      @recipe.id ? "/recipes/#{@recipe.id}" : '/recipes'
    end

    # @return [String]
    def http_method
      @recipe.id ? 'PATCH' : 'POST'
    end

    def cancel_path
      @recipe.id ? "/recipes/#{@recipe.id}" : '/recipes'
    end

    self.template = <<~HTML
      <form action="<%= http_action %>" method="POST">
        <input type="hidden" name="_method" value="<%= http_method %>" />
        <div class="row">
          <div class="col-auto form-group">
            <label for="recipe[section]">Section:</label>
            <select class="custom-select" name="recipe[section]" <%= @recipe.id && 'disabled' %>>
            <% @sections.each do |section| %>
              <option value="<%= section %>" <%= @recipe.section == section && 'selected' %> style="text-transform: capitalize">
                <%= section.tr('-', ' ') %>
              </option>
            <% end %>
            </select>
          </div>
          <div class="col form-group">
            <label for="recipe[name]">Name:</label>
            <input type="text" class="form-control" name="recipe[name]" value="<%= @recipe.name %>" <%= @recipe.id && 'readonly' %> />
          </div>
        </div>
        <div class="row">
          <div class="col form-group">
            <label for="recipe[servings]">Servings:</label>
            <input type="text" class="form-control" name="recipe[servings]" value="<%= @recipe.servings %>" />
          </div>
          <div class="col form-group">
            <label for="recipe[preptime]">Prep time:</label>
            <input type="text" class="form-control" name="recipe[preptime]" value="<%= @recipe.preptime %>" />
          </div>
          <div class="col form-group">
            <label for="recipe[cooktime]">Cook time:</label>
            <input type="text" class="form-control" name="recipe[cooktime]" value="<%= @recipe.cooktime %>" />
          </div>
        </div>
        <%== embed(Components::RecipeForm::EquipmentListComponent,
                   recipe_equipment_list: @recipe.equipment)
        %>
        <button type="button" class="btn btn-outline-secondary mb-3" onclick="addElementToList('equipment', 'equipment-template'); scrollIntoView(false)">
          Add Equipment
        </button>
        <%== embed(Components::RecipeForm::IngredientListComponent,
                   recipe_ingredient_list: @recipe.ingredients)
        %>
        <button type="button" class="btn btn-outline-secondary mb-3" onclick="addElementToList('ingredients', 'ingredient-template'); scrollIntoView(false)">
          Add an Ingredient
        </button>
        <%== embed(Components::RecipeForm::DirectionListComponent,
                   recipe_direction_list: @recipe.directions)
        %>
        <button type="button" class="btn btn-outline-secondary" onclick="addElementToList('directions', 'direction-template'); scrollIntoView(false)">
          Add a Step
        </button>
        <% @recipe.tags.each do |tag| %>
        <input type="hidden" name="recipe[tags][]" value="<%= tag %>" />
        <% end %>
        <hr>
        <a href="<%= cancel_path %>" class="btn btn-outline-secondary">
          Cancel
        </a>
        <button type="submit" class="btn btn-primary float-right">
          <%= @recipe.id ? 'Save Changes' : 'Create Recipe' %>
        </button>
      </form>
      <script>
        function addElementToList(listSelector, templateSelector) {
          const list    = document.getElementById(listSelector);
          const element = document.getElementById(templateSelector).firstElementChild.cloneNode(true);

          list.appendChild(element);
        }
      </script>
    HTML
  end
end
