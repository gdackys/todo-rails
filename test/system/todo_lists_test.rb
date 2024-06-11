require "application_system_test_case"

class TodoListsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit todo_lists_url

    assert_selector "h1", text: "My Todo Lists"

    click_on "My Todo List"

    assert_selector "h1", text: "My Todo List"
  end
end
