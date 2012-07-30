class Subject < ActiveRecord::Base
  acts_as_superclass
  attr_accessible :contact_person, :email, :phone
end
