class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :name
      t.integer :priority
      t.datetime :deadline
      t.boolean :done, default: 'f'
      t.references :project

      t.timestamps
    end
    add_index :tasks, :priority
  end
end
