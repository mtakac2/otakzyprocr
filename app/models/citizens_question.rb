class CitizensQuestion < ActiveRecord::Base
  attr_accessible :citizen_id, :hours, :hours_done, :question_id
  belongs_to :citizen, :class_name => 'Refinery::Citizens::Citizen'
  belongs_to :question, :class_name => 'Refinery::Questions::Question'

  def can_add_hours?
  	return true if self.hours == self.hours_done
  end
end