# frozen_string_literal: true

module Models
  class BaseModel < Dry::Struct
    module Types
      include Dry.Types
    end
  end
end
