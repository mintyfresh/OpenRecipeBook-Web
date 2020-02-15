# frozen_string_literal: true

module Components
  class RecipeComponent < BaseComponent
    self.template_file = root.join('recipe_component.erb')

    option :recipe
  end
end
