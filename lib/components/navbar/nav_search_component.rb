# frozen_string_literal: true

module Components
  module Navbar
    class NavSearchComponent < BaseComponent
      self.template = <<~HTML
        <form class="form-inline my-2 my-lg-0" method="GET" action="/recipes/search">
          <input name="query" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
            Search
          </button>
        </form>
      HTML
    end
  end
end
