# frozen_string_literal: true

module Components
  class FormControlComponent < BaseComponent
    option :label,    default: -> { nil }
    option :name,     default: -> { nil }
    option :type,     default: -> { 'text' }
    option :value,    default: -> { nil }
    option :errors,   default: -> { nil }
    option :readonly, default: -> { false }
    option :disabled, default: -> { false }

    # @return [Boolean]
    def invalid?
      errors&.any?
    end

    # @return [String]
    def class_name
      return @class_name if defined?(@class_name)

      fragments = ['form-control']
      fragments << ['is-invalid'] if invalid?

      @class_name = fragments.join(' ')
    end

    # @return [String]
    def flags
      return @flags if defined?(@flags)

      fragments = []
      fragments << 'disabled' if disabled
      fragments << 'readonly' if readonly

      @flags = fragments.join(' ')
    end

    self.template = <<~HTML
      <% if label %>
      <label for="<%= name %>"><%= label %></label>
      <% end %>
      <% if type == 'textarea' %>
      <textarea class="<%= class_name %>" name="<%= name %>" <%= flags %>><%= value %></textarea>
      <% else %>
      <input type="<%= type %>" class="<%= class_name %>" name="<%= name %>" value="<%= value %>" <%= flags %> />
      <% end %>
      <% if errors %>
      <div class="invalid-feedback">
        <%= errors.join(', ') %>
      </div>
      <% end %>
    HTML
  end
end
