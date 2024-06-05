require "application_system_test_case"

class TodoListTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit todo_list_url

    assert_selector "h1", text: "My Todo List"
  end

  test "creating a todo item" do
    visit todo_list_url

    fill_in "New item...", with: "New Todo Item"

    click_on "Add"

    assert_text "New Todo Item"
  end

  test "creating a todo item without a title" do
    visit todo_list_url

    click_on "Add"

    assert_text "Error"
  end

  test "deleting a todo item" do
    visit todo_list_url

    accept_confirm { click_on "Delete" }

    assert_text "Deleted"
  end
end
