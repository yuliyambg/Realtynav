class PropertiesController < ApplicationController
  # before do
  #   require_login
  #
  # end
  #
  # #CREATE
  get '/properties/new' do
    # if User.find_by(id: session[:user_id])
    # if logged_in?
    #   erb :'recipes/new'
    # else
    #   redirect '/login'
    #   require_login
    erb :'/properties/new'
  end
  #
  post '/properties' do
    # binding.pry
    property = Property.new(params[:property])
    image1 = Image.new(params[:image1])
    image2 = Image.new(params[:image2])
    image3 = Image.new(params[:image3])
    property.images << [image1,image2,image3]
    # User.find_by(id: session[:user_id]).recipes.build(params)

    #validation/authorization edit
    # recipe = current_user.properties
    # if !recipe.title.empty? &&  !recipe.preparation.empty?

    if property.save
      # recipe.save
      redirect '/properties'
    else
      @error = "Data invalid. Please try again."
      erb :'/properties/new'
    end
  end

  #READ
  get '/properties' do
    # if User.find_by(id: session[:user_id])
    # require_login
    @properties = Property.all
    erb :'properties/index'
  end

  #SHOW
  get '/properties/:id' do
    # if User.find_by(id: session[:user_id])
    # require_login
    @property = Property.find_by(id: params[:id])
    if @property
      erb :'properties/show'
    else
      redirect '/properties'
    end
  end
  #
  # #EDIT
  # get '/recipes/:id/edit' do
  #   # require_login
  #   @recipe = Recipe.find(params[:id])
  #   erb :'/recipes/edit'
  # end
  #
  # #UPDATE
  # patch '/recipes/:id' do
  #   @recipe = Recipe.find(params[:id])
  #   if !params["recipe"]["title"].empty? &&  !params["recipe"]["preparation"].empty?
  #     @recipe.update(params["recipe"])
  #     redirect "/recipes/#{params[:id]}"
  #   else
  #     @error = "Data invalid. Please try again."
  #     erb :'/recipes/edit'
  #   end
  # end
  #
  # #DESTROY
  # delete '/recipes/:id' do
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.destroy
  #   redirect '/recipes'
  # end

end