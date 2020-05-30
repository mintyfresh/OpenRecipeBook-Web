# frozen_string_literal: true

module Components
  class IngredientFormComponent < BaseComponent
    self.template_file = root.join('ingredient_form_component.erb')

    include Helpers::FormMethod

    option :ingredient
    option :errors, default: -> { {} }

    # @return [String]
    def http_action
      ingredient.id ? "/ingredients/#{ingredient.id}" : '/ingredients'
    end

    # @return [String]
    def cancel_path
      ingredient.id ? "/ingredients/#{ingredient.id}" : '/ingredients'
    end
  end
end
