# frozen_string_literal: true

module Components
  module Recipe
    class EquipmentListItemComponent < BaseComponent
      option :equipment
      option :index, default: -> { nil }

      # @return [String]
      def id
        index && "id=\"equipment-#{index}\""
      end

      self.template = <<~HTML
        <li <%== id %>>
          <a href="<%= equipment.link || '#' %>">
            <%= equipment.name %>
          </a>
        </li>
      HTML
    end
  end
end
