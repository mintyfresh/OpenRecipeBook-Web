# frozen_string_literal: true

module Components
  class RecipeListComponent < BaseComponent
    self.template_file = root.join('recipe_list_component.erb')

    option :recipes

    # @return [Hash{String => Array<Models::Recipe>}]
    def recipes_by_section
      @recipes_by_section ||= recipes.sort_by(&:name).group_by(&:section).sort.freeze
    end
  end
end
