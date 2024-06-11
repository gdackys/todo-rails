require "application_system_test_case"

class TodoItemsTest < ApplicationSystemTestCase
  setup do
    @todo_list = todo_lists(:one)
  end

  test "visiting the index" do
    visit todo_list_url(@todo_list)

    assert_selector "h1", text: "My Todo List"
  end

  test "creating a todo item" do
    visit todo_list_url(@todo_list)

    fill_in "New item...", with: "New Todo Item"

    click_on "Add"

    assert_text "New Todo Item"
    assert_text "Added"
  end

  test "creating a todo item without a title" do
    visit todo_list_url(@todo_list)

    click_on "Add"

    assert_text "Error"
  end

  test "toggling a todo item" do
    todo_item = todo_items(:one)

    visit todo_list_url(@todo_list)

    check "toggle_todo_item_#{todo_item.id}"

    assert_text "Done"
  end

  test "deleting a todo item" do
    visit todo_list_url(@todo_list)

    accept_confirm { click_on "Delete" }

    assert_text "Deleted"
  end
end
