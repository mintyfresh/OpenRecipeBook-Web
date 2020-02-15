# frozen_string_literal: true

$app.get '/recipes' do
  recipes = Repositories::RecipeRepository.new

  erb :'recipes/index', locals: { recipes: recipes.all }
end

$app.get '/recipes/:section/:slug' do
  recipes = Repositories::RecipeRepository.new
  recipe  = recipes.find(params['section'], params['slug'])

  erb :'recipes/show', locals: { recipe: recipe }
end

$app.get '/recipes/new' do
  recipes = Repositories::RecipeRepository.new

  erb :'recipes/new', locals: { recipe: Models::Recipe.empty, sections: recipes.sections, errors: {} }
end

$app.post '/recipes' do
  recipes  = Repositories::RecipeRepository.new
  contract = Contracts::CreateRecipeContract.new
  result   = contract.call(request.POST.fetch('recipe'))

  if result.success?
    recipe = recipes.create(result.to_h)

    redirect to("/recipes/#{recipe.id}")
  else
    recipe = Models::Recipe.new(result.to_h)

    erb :'recipes/new', locals: { recipe: recipe, sections: recipes.sections, errors: result.errors }
  end
end

$app.get '/recipes/:section/:slug/edit' do
  recipes = Repositories::RecipeRepository.new
  recipe  = recipes.find(params['section'], params['slug'])

  erb :'recipes/edit', locals: { recipe: recipe, sections: recipes.sections }
end

$app.patch '/recipes/:section/:slug' do
  recipes = Repositories::RecipeRepository.new
  recipe  = recipes.find(params['section'], params['slug'])
  recipes.update(recipe, request.POST.fetch('recipe'))

  redirect to("/recipes/#{recipe.id}")
end

$app.get '/recipes/:section/:slug/delete' do
  recipes = Repositories::RecipeRepository.new
  recipe  = recipes.find(params['section'], params['slug'])

  erb :'recipes/delete', locals: { recipe: recipe }
end

$app.delete '/recipes/:section/:slug' do
  recipes = Repositories::RecipeRepository.new
  recipe  = recipes.find(params['section'], params['slug'])
  recipes.delete(recipe)

  redirect to('/recipes')
end

$app.get '/equipment' do
  repository = Repositories::EquipmentRepository.new
  equipment  = repository.all

  erb :'equipment/index', locals: { equipment: equipment }
end

$app.get '/equipment/:id' do
  repository = Repositories::EquipmentRepository.new
  equipment  = repository.find(params['id'])

  erb :'equipment/show', locals: { equipment: equipment }
end

$app.get '/ingredients' do
  repository  = Repositories::IngredientRepository.new
  ingredients = repository.all

  erb :'ingredients/index', locals: { ingredients: ingredients }
end

$app.get '/ingredients/:id' do
  repository = Repositories::IngredientRepository.new
  ingredient = repository.find(params['id'])

  erb :'ingredients/show', locals: { ingredient: ingredient }
end
