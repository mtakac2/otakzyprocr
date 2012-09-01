module Refinery
  module Politicians
    class Politician < Refinery::Core::BaseModel
      self.table_name = 'refinery_politicians'
      inherits_from :subject

      attr_accessible :firstname, :lastname, :position

      acts_as_indexed :fields => [:firstname, :lastname]
      
      validates_presence_of :firstname, :lastname
    end
  end
end
