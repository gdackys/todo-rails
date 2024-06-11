class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_items

  def create
    @todo_item = @todo_items.build(safe_params)

    respond_to do |format|
      if @todo_item.save
        flash[:notice] = "Added"

        format.turbo_stream {  }
        format.html { redirect_to todo_list_path(@todo_list) }
      else
        flash[:alert] = "Error"

        format.turbo_stream { render "alert" }
        format.html { redirect_to todo_list_path(@todo_list) }
      end
    end
  end

  def toggle
    @todo_item = @todo_items.find(params[:id])
    @todo_item.toggle!(:done)

    flash[:notice] = "Done" if @todo_item.done?

    respond_to do |format|
      format.turbo_stream {}
      format.html { redirect_to todo_list_path(@todo_list) }
    end
  end

  def destroy
    @todo_item = @todo_items.find(params[:id])

    respond_to do |format|
      if @todo_item.destroy
        flash[:notice] = "Deleted"

        format.turbo_stream {}
        format.html { redirect_to todo_list_path(@todo_list) }
      else
        flash[:alert] = "Error"

        format.turbo_stream { render "alert" }
        format.html { redirect_to todo_list_path(@todo_list) }
      end
    end
  end

  private

  def safe_params
    params.require(:todo_item).permit(:title)
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_items
    @todo_items = @todo_list.todo_items
  end
end
