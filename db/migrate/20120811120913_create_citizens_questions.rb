class CreateCitizensQuestions < ActiveRecord::Migration
  def up
    create_table :citizens_questions do |t|
      t.integer :citizen_id
      t.integer :question_id
      t.integer :hours

      t.timestamps      
    end

    add_index :citizens_questions, :citizen_id
      add_index :citizens_questions, :question_id
      add_index :citizens_questions, [:citizen_id, :question_id], :unique => true
  end

  def down
    drop_table :citizens_questions
  end
end