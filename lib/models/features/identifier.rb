# frozen_string_literal: true

module Models
  module Features
    module Identifier
      # @param klass [Class]
      # @return [void]
      def self.included(klass)
        super(klass)
        klass.attribute(:id, klass::Types::String.optional.default(nil))
      end

      # @abstract
      # @param input [String]
      # @return [String]
      def generate_identifier(input)
        raise "#{self.class.name}[#{id.inspect}] already has an ID." if id

        attributes[:id] = format_identifier(input)
      end

    private

      # @param input [String]
      # @return [String]
      def format_identifier(input)
        input.strip.downcase.gsub(/[ ._-]+/, '-')
      end
    end
  end
end
