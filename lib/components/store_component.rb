# frozen_string_literal: true

module Components
  class StoreComponent < BaseComponent
    # @param store [Models::Store]
    def initialize(store:)
      @store = store
    end

    self.template = <<~HTML
      <a href="<%= @store.link || '#' %>">
        <%= @store.name %>
      </a>
    HTML
  end
end
