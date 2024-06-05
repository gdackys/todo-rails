class TodoItemsController < ApplicationController
  def create
    todo_item = TodoItem.new(safe_params)

    if todo_item.save
      redirect_to todo_list_path, notice: "Added"
    else
      redirect_to todo_list_path, alert: "Error"
    end
  end

  private

  def safe_params
    params.require(:todo_item).permit(:todo_list_id, :title)
  end
end
