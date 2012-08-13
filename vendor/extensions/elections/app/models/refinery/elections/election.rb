module Refinery
  module Elections
    class Election < Refinery::Core::BaseModel
      self.table_name = 'refinery_elections'
      belongs_to :election_type
      has_many :election_subject_elections
      has_many :subjects, :through => :election_subject_elections
      has_many :questions, :class_name => 'Refinery::Questions::Question'

      attr_accessible :election_type_id, :held, :description, :position            
    end
  end
end