class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    #username and password cannot be blank
    # username can not already exist
    user = User.new(params)
    # if user.username.empty? || user.password.empty?
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