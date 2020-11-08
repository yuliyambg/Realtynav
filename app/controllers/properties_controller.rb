class PropertiesController < ApplicationController

  # CREATE
  get '/properties/new' do
    erb :'/properties/new'
  end
  #
  post '/properties' do
    property = Property.new(params[:property])
    property.user_id = session[:user_id]
    image1 = Image.new(params[:image1])
    image2 = Image.new(params[:image2])
    image3 = Image.new(params[:image3])
    property.images << [image1,image2,image3]

    if property.save
      redirect '/properties'
    else
      @error = "Data invalid. Please try again."
      erb :'/properties/new'
    end
  end

  #READ
  get '/properties' do
    @properties = Property.all
    erb :'properties/index'
  end

  #SHOW
  get '/properties/:id' do
    @property = Property.find_by(id: params[:id])

    # puts @property
    # puts @property.images
    if @property
      erb :'properties/show'
    else
      redirect '/properties'
    end
  end

  #EDIT
  get '/properties/:id/edit' do
    # require_login

    @property = Property.find(params[:id])
    if @property.user_id == session[:user_id]
    erb :'/properties/edit'
    else
      @properties = Property.all
      @error = "Not authorized"
      erb :'/properties/index'
      end
  end

  #UPDATE
  patch '/properties/:id' do

    @property = Property.find(params[:id])

    if !params["property"]["price"].empty? &&  !params["property"]["str_address"].empty?

      @property.images.destroy_all
      @property.images.build([params["image1"], params["image2"],params["image3"]])
      @property.update(params["property"])

      redirect "/properties/#{params[:id]}"
    else
      @error = "Data invalid. Please try again."
      erb :'/properties/edit'
    end
  end

  #DESTROY
  delete '/properties/:id' do
    @property = Property.find(params[:id])
    @property.destroy
    redirect '/properties'
  end

end