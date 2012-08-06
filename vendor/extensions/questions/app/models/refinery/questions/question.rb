module Refinery
  module Questions
    class Question < Refinery::Core::BaseModel
      self.table_name = 'refinery_questions'
      belongs_to :election, :class_name => 'Refinery::Elections::Election'
      belongs_to :subject

      attr_accessible :title, :content, :election_id, :subject_id, :position

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
