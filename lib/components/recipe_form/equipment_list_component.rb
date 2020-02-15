# frozen_string_literal: true

module Components
  module RecipeForm
    class EquipmentListComponent < BaseComponent
      option :equipment
      option :errors,               default: -> { {} }
      option :equipment_repository, default: -> { Repositories::EquipmentRepository.new }

      # @return [Array<Models::Equipment>]
      def equipment_options
        @equipment_options ||= equipment_repository.all.sort_by(&:name).freeze
      end

      self.template = <<~HTML
        <div id="equipment-list">
          <label class="h3">Equipment:</label>
          <% equipment.each_with_index do |equipment, index| %>
          <%== draw(Components::RecipeForm::EquipmentListItemComponent,
                    equipment:         equipment,
                    equipment_options: equipment_options,
                    errors:            errors && errors[index])
          %>
          <% end %>
        </div>
        <div id="equipment-template" style="display: none">
          <%== draw(Components::RecipeForm::EquipmentListItemComponent,
                    equipment:         Models::RecipeEquipment.empty,
                    equipment_options: equipment_options) %>
        </div>
      HTML
    end
  end
end
