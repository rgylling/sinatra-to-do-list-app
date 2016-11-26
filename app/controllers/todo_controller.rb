class TodosController < ApplicationController

  get '/todos' do
    erb :'todos/todos'
  end

end
