class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.references :question

      t.timestamps
    end
    add_index :tasks, :question_id
  end
end