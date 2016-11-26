class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/todos'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    if params.any?{|key, val| val.empty?}
      redirect to '/signup'
    else
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect to '/todos'
    end
  end

  get '/todos' do
    erb :'todos'
  end

end
