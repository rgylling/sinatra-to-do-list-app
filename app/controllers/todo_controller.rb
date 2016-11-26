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
    if params[:content].empty?
      redirect to 'todos/new'
    else
      todo =Todo.create(content: params[:content], user_id: current_user.id)
      redirect to '/todos'
    end
  end

  get '/todos/:id' do
    if logged_in?
      @todo = Todo.find_by_id(params[:id])
      erb :'todos/edit_todo'
    else
      redirect to '/login'
    end
  end

end
