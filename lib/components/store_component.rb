# frozen_string_literal: true

module Components
  class StoreComponent < BaseComponent
    option :store

    self.template = <<~HTML
      <a href="<%= @store.link || '#' %>">
        <%= @store.name %>
      </a>
    HTML
  end
end
