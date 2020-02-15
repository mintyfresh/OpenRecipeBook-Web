# frozen_string_literal: true

module Components
  module RecipeForm
    class EquipmentListItemComponent < BaseComponent
      self.template_file = root.join('recipe_form', 'equipment_list_item_component.erb')

      option :equipment
      option :equipment_options
      option :errors, default: -> { {} }
    end
  end
end
