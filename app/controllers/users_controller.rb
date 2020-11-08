class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.new(params)
    # user cannot save if validation fails
    if user.save
      session[:user_id] = user.id
      redirect '/properties'
    else
      @error = "Invalid Credentials"
      erb :'users/signup'
    end
  end

end