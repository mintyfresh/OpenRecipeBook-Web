# frozen_string_literal: true

$app.get '/recipes' do
  recipes = Repositories::RecipeRepository.new

  erb :'recipes/index', locals: { recipes: recipes.all }
end

$app.get '/recipes/*/edit' do
  recipes = Repositories::RecipeRepository.new

  erb :'recipes/edit', locals: { recipe: recipes.find(params['splat'][0]) }
end

$app.get '/recipes/*' do
  recipes = Repositories::RecipeRepository.new

  erb :'recipes/show', locals: { recipe: recipes.find(params['splat'][0]) }
end

$app.put '/recipes/*' do
  recipes = Repositories::RecipeRepository.new
  recipe  = Models::Recipe.new(request.POST.fetch('recipe').merge(id: params['splat'][0]))
  recipes.save(recipe)

  redirect to("/recipes/#{recipe.id}")
end
