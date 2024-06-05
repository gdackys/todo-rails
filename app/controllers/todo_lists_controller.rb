class TodoListsController < ApplicationController
  def show
    @todo_list = TodoList.first
    @todo_items = @todo_list.todo_items
    @new_item = TodoItem.new(todo_list: @todo_list)
  end
end
