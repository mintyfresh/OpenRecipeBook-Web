# frozen_string_literal: true

module Components
  module Navbar
    class NavLinkComponent < BaseComponent
      option :href
      option :label

      self.template = <<~HTML
        <li class="nav-item">
          <a class="nav-link" href="<%= href %>"><%= label %></a>
        </li>
      HTML
    end
  end
end
