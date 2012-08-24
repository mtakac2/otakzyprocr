class AddHoursDoneToCitizensQuestions < ActiveRecord::Migration
  def change
  	add_column :citizens_questions, :hours_done, :integer, default: 0
  end
end