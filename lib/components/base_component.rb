# frozen_string_literal: true

module Components
  class BaseComponent
    include DrawComponent

    extend Dry::Initializer

    class << self
      # @return [String, nil]
      attr_reader :template
      # @return [Pathname, nil]
      attr_reader :template_file

      # @return [Pathname]
      def root
        @root ||= $app.root.join('lib', 'components').freeze
      end

      # @param template [String]
      # @return [void]
      def template=(template)
        @template      = template
        @template_file = nil
      end

      # @param template_file [Pathname]
      # @return [void]
      def template_file=(template_file)
        @template      = nil
        @template_file = template_file
      end
    end

    # @return [String]
    def render_component
      renderer.evaluate(self)
    end

    # @return [String]
    def template
      if (template = self.class.template)
        template
      elsif (template_file = self.class.template_file)
        @template ||= File.read(template_file)
      else
        raise(NotImplementedError, "#{self.class.name} does not define a template.")
      end
    end

  private

    # @return [String]
    def renderer
      @renderer ||= Erubis::EscapedEruby.new(template)
    end
  end
end
