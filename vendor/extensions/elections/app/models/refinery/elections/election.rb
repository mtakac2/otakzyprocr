module Refinery
  module Elections
    class Election < Refinery::Core::BaseModel
      self.table_name = 'refinery_elections'
      belongs_to :election_type

      attr_accessible :title, :election_type_id, :held, :notes, :position

      acts_as_indexed :fields => [:title, :notes]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
