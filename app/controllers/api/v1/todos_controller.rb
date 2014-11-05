class Api::V1::TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      # Send error response
    end
  end

  private

  def todo_params
    params.permit(:completed, :order, :title)
  end

end
