class CreateTodoitems < ActiveRecord::Migration[5.2]
  def change
    create_table :todoitems do |t|
      t.references :todolist, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
