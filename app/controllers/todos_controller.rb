class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @completed_todo = Todo.where(completed: true)
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path, notice: 'Todo created!'
    else
      render :index, alert: 'A problem occured!'
    end
  end

  def checked
    @todo = Todo.find(params[:id])
    @todo.update( completed: params[:completed])

    render json: { message: "Todo marked as completed!" }
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
