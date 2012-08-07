module Refinery
  module Emails
    class Email < Refinery::Core::BaseModel
      self.table_name = 'refinery_emails'

      attr_accessible :title, :content, :position, :for

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
