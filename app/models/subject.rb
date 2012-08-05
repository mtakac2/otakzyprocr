class Subject < ActiveRecord::Base
  acts_as_superclass
  attr_accessible :keeper_id, :subtype

  belongs_to :keeper, :class_name => 'Refinery::Keepers::Keeper'
  has_many :election_subject_elections
  has_many :elections, :through => :election_subject_elections    
end