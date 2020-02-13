# frozen_string_literal: true

module Components
  module Recipe
    class EquipmentListItemComponent < BaseComponent
      # @param equipment [Array<Models::RecipeEquipment>]
      # @param index [Integer, nil]
      def initialize(equipment:, index: nil)
        @equipment = equipment
        @index     = index
      end

      # @return [String]
      def id
        @index && "id=\"equipment-#{@index}\""
      end

      self.template = <<~HTML
        <li <%== id %>>
          <a href="<%= @equipment.link || '#' %>">
            <%= @equipment.name %>
          </a>
        </li>
      HTML
    end
  end
end
