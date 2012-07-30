module Refinery
  module Elections
    class ElectionType < Refinery::Core::BaseModel
      self.table_name = 'refinery_election_types'
      has_many :elections

      attr_accessible :name

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end