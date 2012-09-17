class AddTeamleaderToCitizensQuestions < ActiveRecord::Migration
  def change
    add_column :citizens_questions, :teamleader, :integer, default: 0
  end
end
