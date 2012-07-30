module Refinery
  module Politicians
    class Politician < Refinery::Core::BaseModel
      self.table_name = 'refinery_politicians'
      inherits_from :subject

      attr_accessible :firstname, :lastname, :notes, :position

      acts_as_indexed :fields => [:firstname]

      validates :firstname, :presence => true, :uniqueness => true
    end
  end
end