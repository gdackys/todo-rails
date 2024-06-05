class CreateTodoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_items do |t|
      t.belongs_to :todo_list, null: false, foreign_key: true

      t.string :title, null: false
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
