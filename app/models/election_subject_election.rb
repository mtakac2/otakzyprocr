class ElectionSubjectElection < ActiveRecord::Base
  self.table_name = 'election_subject_elections'
  attr_accessible :election_id, :election_subject_id, :subject_id
  belongs_to :subject
  belongs_to :election, :class_name => 'Refinery::Elections::Election'
end