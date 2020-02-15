# frozen_string_literal: true

module Components
  class IngredientListComponent < BaseComponent
    self.template_file = root.join('ingredient_list_component.erb')

    option :ingredients
  end
end
