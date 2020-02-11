# frozen_string_literal: true

module Models
  class BaseModel < Dry::Struct
    transform_keys(&:to_sym)

    module Types
      include Dry.Types
    end
  end
end
