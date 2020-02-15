# frozen_string_literal: true

module Components
  class IngredientComponent < BaseComponent
    self.template_file = root.join('ingredient_component.erb')

    option :ingredient
  end
end
