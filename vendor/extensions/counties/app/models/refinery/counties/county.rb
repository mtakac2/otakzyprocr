module Refinery
  module Counties
    class County < Refinery::Core::BaseModel
      self.table_name = 'refinery_counties'

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
