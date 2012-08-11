class CitizensQuestion < ActiveRecord::Base
  attr_accessible :citizen_id, :hours, :question_id
  belongs_to :citizen, :class_name => 'Refinery::Citizens::Citizen'
  belongs_to :question, :class_name => 'Refinery::Questions::Question'
end
