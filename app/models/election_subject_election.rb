# == Schema Information
#
# Table name: election_subject_elections
#
#  id          :integer          not null, primary key
#  subject_id  :integer
#  election_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ElectionSubjectElection < ActiveRecord::Base
  self.table_name = 'election_subject_elections'
  attr_accessible :election_id, :election_subject_id, :subject_id
  belongs_to :subject
  belongs_to :election, :class_name => 'Refinery::Elections::Election'  
end
