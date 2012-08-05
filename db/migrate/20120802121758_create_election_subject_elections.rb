class CreateElectionSubjectElections < ActiveRecord::Migration
  def change
    create_table :election_subject_elections do |t|
      t.integer :subject_id
      t.integer :election_id

      t.timestamps
    end
  end
end