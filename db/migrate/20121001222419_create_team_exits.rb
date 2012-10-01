class CreateTeamExits < ActiveRecord::Migration
  def change
    create_table :team_exits do |t|
      t.integer :question_id
      t.integer :citizen_id

      t.timestamps
    end
  end
end
