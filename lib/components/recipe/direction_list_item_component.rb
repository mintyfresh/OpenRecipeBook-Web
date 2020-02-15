# frozen_string_literal: true

module Components
  module Recipe
    class DirectionListItemComponent < BaseComponent
      option :direction
      option :index, default: -> { nil }

      # @return [String]
      def id
        index && "id=\"direction-#{index}\""
      end

      self.template = <<~HTML
        <li <%== id %>>
          <%= direction.step %>
          <% if direction.note %>
            <br>
            <i><%= direction.note %></i>
          <% end %>
        </li>
      HTML
    end
  end
end
