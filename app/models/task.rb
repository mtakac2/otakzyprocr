class Task < ActiveRecord::Base
  belongs_to :question, class_name: 'Refinery::Questions::Question'
  attr_accessible :content
end