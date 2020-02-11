# frozen_string_literal: true

# @return [void]
def reload!
  Application.loader.reload
end
