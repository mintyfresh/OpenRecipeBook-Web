# frozen_string_literal: true

module Components
  class EquipmentComponent < BaseComponent
    self.template_file = root.join('equipment_component.erb')

    option :equipment
  end
end
