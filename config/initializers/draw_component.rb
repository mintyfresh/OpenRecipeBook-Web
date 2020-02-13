# frozen_string_literal: true

module DrawComponent
  # @param component [Class<Component::BaseComponent>]
  # @param locals [Hash]
  # @return [String]
  def draw(component, **locals)
    component.new(**locals).render_component
  end
end

$app.include(DrawComponent)
