# frozen_string_literal: true

module Components
  class StoreListItemComponent < BaseComponent
    self.template_file = root.join('store_list_item_component.erb')

    option :store
    option :errors, default: -> { {} }
  end
end
