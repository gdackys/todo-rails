list = TodoList.find_or_create_by(name: "My Todo List")
list.todo_items.find_or_create_by(title: "My Todo Item")
