# frozen_string_literal: true

$app.get '/recipes' do
  recipes = Repositories::RecipeRepository.new

  erb :'recipes/index', locals: { recipes: recipes.all }
end

$app.get '/recipes/*' do
  recipes = Repositories::RecipeRepository.new

  erb :'recipes/show', locals: { recipe: recipes.find(params['splat'][0]) }
end
