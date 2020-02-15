# frozen_string_literal: true

module Components
  class RecipeFormComponent < BaseComponent
    self.template_file = root.join('recipe_form_component.erb')

    include Helpers::FormMethod

    option :recipe
    option :errors, default: -> { {} }
    option :recipe_repository, default: -> { Repositories::RecipeRepository.new }

    # @return [Array<String>]
    def sections
      @sections ||= recipe_repository.sections.freeze
    end

    # @return [String]
    def http_action
      recipe.id ? "/recipes/#{recipe.id}" : '/recipes'
    end

    # @return [String]
    def cancel_path
      recipe.id ? "/recipes/#{recipe.id}" : '/recipes'
    end
  end
end
