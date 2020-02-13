# frozen_string_literal: true

module Components
  module RecipeForm
    class EquipmentListComponent < BaseComponent
      # @param recipe_equipment_list [Array<Models::RecipeEquipment>]
      # @param equipment_repository [Repositories::EquipmentRepository]
      def initialize(recipe_equipment_list:, equipment_repository: Repositories::EquipmentRepository.new)
        @recipe_equipment_list = recipe_equipment_list
        @equipment_repository  = equipment_repository
      end

      # @return [Array<Models::Equipment>]
      def equipment_options
        @equipment_options ||= @equipment_repository.all.sort_by(&:name).freeze
      end

      self.template = <<~HTML
        <div id="equipment-list">
          <label class="h3">Equipment:</label>
          <% @recipe_equipment_list.each do |recipe_equipment| %>
          <%== draw(Components::RecipeForm::EquipmentListItemComponent,
                    recipe_equipment:  recipe_equipment,
                    equipment_options: equipment_options)
          %>
          <% end %>
        </div>
        <div id="equipment-template" style="display: none">
          <%== draw(Components::RecipeForm::EquipmentListItemComponent,
                    recipe_equipment:  Models::RecipeEquipment.empty,
                    equipment_options: equipment_options) %>
        </div>
      HTML
    end
  end
end
