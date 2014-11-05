class Api::V1::TodosController < ApplicationController
  before_filter :load_todo, only: [:update]


  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: {errors: @todo.errors}, status: :bad_request
    end
  end

  def update
    if @todo.update(todo_params)
    	render json: @todo, status: :ok
		else
			render json: {errors: @todo.errors}, status: :bad_request
		end

  end

  private

  def load_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.permit(:completed, :order, :title)
  end

end
