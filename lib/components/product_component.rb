# frozen_string_literal: true

module Components
  class ProductComponent < BaseComponent
    self.template_file = root.join('product_component.erb')

    option :product
  end
end
