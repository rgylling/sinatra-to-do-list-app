class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/admin'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    if params.any?{|key, val| val.empty?}
      redirect to '/error'
    else
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect to '/admin'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/admin'
    else
      redirect to '/error'
    end
  end

  get '/error' do
    erb :'error'
  end

  get '/admin' do
   erb :'users/admin'
  end

  get '/signout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirect to '/'
    end
  end

end
