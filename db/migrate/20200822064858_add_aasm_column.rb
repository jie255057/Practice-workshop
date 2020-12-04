class AddAasmColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :task_state, :string
  end
end
