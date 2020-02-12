# frozen_string_literal: true

module Components
  class BaseComponent
    include ComponentRenderer

    class << self
      # @return [String]
      attr_accessor :template
    end

    # @return [String]
    def render_component
      renderer.evaluate(self)
    end

    # @return [String]
    def template
      self.class.template || raise(NotImplementedError, "#{name} does not define a template.")
    end

  private

    # @return [String]
    def renderer
      @renderer ||= Erubis::EscapedEruby.new(template)
    end
  end
end
