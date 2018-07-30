class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'index'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'show'
  end

  get '/articles/:id/edit' do  #load edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do #edit action
    @recipe = Article.find_by_id(params[:id])
    @recipe.title = params[:title]
    @recipe.content = params[:content]
    @recipe.save
    redirect to "/articles/#{@article.id}"
  end
