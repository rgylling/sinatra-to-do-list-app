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

  get '/todos/:id/edit' do
    if logged_in?
      @todo = Todo.find_by_id(params[:id])
      if current_user.id == @todo.user_id
        erb :'/todos/edit_todo'
      end
    else
      redirect to '/'
    end
  end

  patch '/todos/:id' do
    if params[:content].empty?
      redirect to "/todos/#{params[:id]}/edit"
    else
      @todo = Todo.find_by_id(params[:id])
      @todo.content = params[:content]
      @todo.save
      redirect to "/todos/#{@todo.id}"
    end
  end

  delete '/todo/:id/delete' do
    if logged_in?
      @todo = Todo.find_by_id(params[:id])
      if current_user.id == @todo.user_id
        @todo.delete
        redirect to '/todos'
      end
    else
      redirect to '/'
    end
  end


end
