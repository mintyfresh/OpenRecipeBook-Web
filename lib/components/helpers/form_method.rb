# frozen_string_literal: true

module Components
  module Helpers
    module FormMethod
      # @param input [String]
      # @return [String]
      def form_method(input)
        case input
        when Models::BaseModel
          form_method(input.id ? 'PATCH' : 'POST')
        when Symbol, String
          <<~HTML.strip
            <input type="hidden" name="_method" value="#{input}" />
          HTML
        else
          raise TypeError, "Unsupported input: #{input.class.name}"
        end
      end
    end
  end
end
