# require_relative "../models/recipe.rb"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get /\/|\/recipes/ do
    erb :index, :locals => {recipes: Recipe.all}
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  get "/recipes/:id" do |id|
    erb :show, :locals => {recipe: Recipe.find(id)}
  end

  delete "/recipes/:id" do |id|
    recipe = Recipe.find(id)
    recipe.delete
    redirect "/recipes"
  end

  get "/recipes/:id/edit" do |id|
    erb :edit, :locals => {recipe: Recipe.find(id)}
  end

  patch "/recipes/:id/edit" do |id|
    recipe = Recipe.find(id)
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end

  delete "/recipes/:id" do |id|
    recipe = Recipe.find(id)
    recipe.delete
    redirect "/recipes"
  end

end
