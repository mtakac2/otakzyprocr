module Refinery
  module Parties
    class Party < Refinery::Core::BaseModel
      self.table_name = 'refinery_parties'
      inherits_from :subject

      attr_accessible :name, :parliament_candidates, :senat_candidates, :county_leaders, :position

      acts_as_indexed :fields => [:name, :parliament_candidates, :senat_candidates, :county_leaders]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end