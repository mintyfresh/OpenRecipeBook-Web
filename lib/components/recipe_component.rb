# frozen_string_literal: true

module Components
  class RecipeComponent < BaseComponent
    self.template_file = root.join('recipe_component.erb')

    def initialize(recipe:)
      @recipe = recipe
    end
  end
end
