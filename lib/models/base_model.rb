# frozen_string_literal: true

module Models
  class BaseModel < Dry::Struct
    transform_keys(&:to_sym)

    module Types
      include Dry.Types

      StrippedString = Types::String.constructor do |value|
        case value
        when String
          value.strip
        else
          value
        end
      end

      NonEmptyString = StrippedString.optional.constructor do |value|
        case value
        when nil
          nil
        when String
          (value = value.strip).empty? ? nil : value
        else
          value
        end
      end

      Quantity = Types::Coercible::Integer | Types::Coercible::Float | Types::String
    end

    # @param object [Models::BaseModel]
    # @param new_attributes [Hash]
    # @return [Models::BaseModel]
    def self.rebuild(object, new_attributes)
      new(object.attributes.deep_merge(new_attributes))
    end

    # @abstract
    # @return [Hash]
    def serializable_hash
      raise NotImplementedError, "#{self.class.name} does not implement #{__method__}."
    end
  end
end
