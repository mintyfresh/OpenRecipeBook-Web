# frozen_string_literal: true

module Services
  class SearchService
    extend Dry::Initializer

    TOKEN_DELIMITER = /\b/.freeze
    TOKEN_FILTER    = /\w+/.freeze

    option :recipe_repository, default: -> { Repositories::RecipeRepository.new }

    # @param query [String, nil]
    # @return [Array<Models::Recipe>]
    def search(query:)
      return [] if query.nil? || query.empty?

      query = tokenize(query)

      recipe_repository.all
        .map { |recipe| SearchResult.new(recipe, 0) }
        .each(&calculate_score(query))
        .select(&:match?)
        .sort_by { |result| -result.score }
        .map(&:recipe)
    end

  private

    SearchResult = Struct.new(:recipe, :score) do
      # @return [Boolean]
      def match?
        score.positive?
      end
    end

    # @param query [Array<String>]
    # @return [Proc]
    def calculate_score(query)
      lambda do |result|
        result.score += score_for_name(result.recipe, query)
        result.score += score_for_equipment(result.recipe, query)
        result.score += score_for_ingredients(result.recipe, query)
        result.score += score_for_tags(result.recipe, query)
      end
    end

    # @param recipe [Models::Recipe]
    # @param query [Array<String>]
    # @return [Float]
    def score_for_name(recipe, query)
      match?(recipe.name, query) ? 1 : 0
    end

    # @param recipe [Models::Recipe]
    # @param query [Array<String>]
    # @return [Float]
    def score_for_equipment(recipe, query)
      recipe.equipment.sum do |equipment|
        match?(equipment.name, query) ? 0.1 : 0
      end
    end

    # @param recipe [Models::Recipe]
    # @param query [Array<String>]
    # @return [Float]
    def score_for_ingredients(recipe, query)
      recipe.ingredients.sum do |ingredient|
        match?(ingredient.name, query) ? 0.1 : 0
      end
    end

    # @param recipe [Models::Recipe]
    # @param query [Array<String>]
    # @return [Float]
    def score_for_tags(recipe, query)
      recipe.tags.sum do |tag|
        match?(tag, query) ? 0.25 : 0
      end
    end

    # @param text [String]
    # @param query [Array<String>]
    # @return [Boolean]
    def match?(text, query)
      (tokenize(text) & query).any?
    end

    # @param text [String]
    # @return [Array<String>]
    def tokenize(text)
      text.downcase.split(TOKEN_DELIMITER).map(&:strip).select { |w| TOKEN_FILTER.match?(w) }
    end
  end
end
