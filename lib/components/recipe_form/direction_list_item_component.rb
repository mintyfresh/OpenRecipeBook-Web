# frozen_string_literal: true

module Components
  module RecipeForm
    class DirectionListItemComponent < BaseComponent
      self.template_file = root.join('recipe_form', 'direction_list_item_component.erb')

      option :direction
      option :errors, default: -> { {} }
    end
  end
end
