# frozen_string_literal: true

module Components
  class ProductComponent < BaseComponent
    # @param product [Models::Product]
    def initialize(product:)
      @product = product
    end

    self.template = <<~HTML
      <h2><%= @product.name %></h2>
      Purchasing options:
      <ul>
      <% @product.stores.each do |store| %>
        <li><%== embed(Components::StoreComponent, store: store) %></li>
      <% end %>
      </ul>
    HTML
  end
end
