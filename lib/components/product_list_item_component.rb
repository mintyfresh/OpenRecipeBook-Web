# frozen_string_literal: true

module Components
  class ProductListItemComponent < BaseComponent
    self.template_file = root.join('product_list_item_component.erb')

    option :product
    option :errors, default: -> { {} }
  end
end
