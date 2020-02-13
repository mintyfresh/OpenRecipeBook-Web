# frozen_string_literal: true

module Components
  module Recipe
    class EquipmentListComponent < BaseComponent
      # @param equipment [Array<Models::RecipeEquipment>]
      def initialize(equipment:)
        @equipment = equipment
      end

      self.template = <<~HTML
        <% if @equipment && @equipment.any? %>
        <div id="equipment-list">
          <h2>Equipment</h2>
          <ul>
          <% @equipment.each_with_index do |equipment, index| %>
            <%== draw(Components::Recipe::EquipmentListItemComponent, equipment: equipment, index: index) %>
          <% end %>
          </ul>
        </div>
        <% end %>
      HTML
    end
  end
end
