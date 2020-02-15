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

      recipe_repository.all(lazy: true)
        .map     { |recipe| calculate_score(recipe, query) }
        .select  { |result| result.score.positive? }
        .sort_by { |result| -result.score }
        .map(&:recipe)
    end

  private

    SearchResult = Struct.new(:recipe, :score)

    # @param recipe [Models::Recipe]
    # @param query [Array<String>]
    # @return [SearchResult]
    def calculate_score(recipe, query)
      score = 0

      score += score_for_name(recipe, query)
      score += score_for_equipment(recipe, query)
      score += score_for_ingredients(recipe, query)
      score += score_for_tags(recipe, query)

      SearchResult.new(recipe, score)
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
