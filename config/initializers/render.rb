# frozen_string_literal: true

module ComponentRenderer
  # @param component [Class<Component::BaseComponent>]
  # @param locals [Hash]
  # @return [String]
  def embed(component, **locals)
    component.new(**locals).render_component
  end
end

$app.include(ComponentRenderer)
