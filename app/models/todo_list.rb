class TodoList < ApplicationRecord
  has_many :todo_items, -> { order(id: :desc) }, dependent: :delete_all
end
