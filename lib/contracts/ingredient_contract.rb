# frozen_string_literal: true

module Contracts
  class RecipeContract < BaseContract
    params do
      required(:name).filled(:string)

      optional(:products).array do
        hash do
          required(:name).filled(:string)
          optional(:stores).array do
            hash do
              required(:name).filled(:string)
              required(:link).filled(:string)
            end
          end
        end
      end
    end
  end
end
