class TodosController < ApplicationController

  get '/todos' do
    if logged_in?
      @todos = Todo.all
      erb :'todos/todos'
    else
      redirect to '/'
    end
  end

  get '/todos/new' do
    if logged_in?
      erb :'todos/create_todo'
    else
      redirect to '/'
    end
  end

  post '/todos' do


  end

end
