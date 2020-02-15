# frozen_string_literal: true

module Components
  class EquipmentListComponent < BaseComponent
    self.template_file = root.join('equipment_list_component.erb')

    option :equipment
  end
end
