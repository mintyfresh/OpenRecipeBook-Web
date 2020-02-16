# frozen_string_literal: true

module Contracts
  class SetupContract < BaseContract
    params do
      required(:git_url).filled(:string, format?: URI::DEFAULT_PARSER.make_regexp)
    end
  end
end
