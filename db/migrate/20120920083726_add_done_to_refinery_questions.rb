class AddDoneToRefineryQuestions < ActiveRecord::Migration
  def change
    add_column :refinery_questions, :done, :boolean, default: false
  end
end