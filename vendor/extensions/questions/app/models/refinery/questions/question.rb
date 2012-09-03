# encoding: UTF-8

module Refinery
  module Questions
    class Question < Refinery::Core::BaseModel
      self.table_name = 'refinery_questions'
      belongs_to :election, :class_name => 'Refinery::Elections::Election'
      belongs_to :subject
      has_many :citizens_questions, :class_name => 'CitizensQuestion'
      has_many :citizens, :through => :citizens_questions

      attr_accessible :title, :content, :election_id, :subject_id, :position

      acts_as_indexed :fields => [:title, :content]

      validate :permited_question_count
      validates :title, :presence => true, :uniqueness => true      

      def permited_question_count
        if (self.election.election_type.name == 'Prezidentské volby' && get_questions_count_for_subject(self.subject_id) >= 2) || (self.election.election_type.name != 'Prezidentské volby' && get_questions_count_for_subject(self.subject_id) >= 1) 
            errors.add(:count, 'dosáhli ste maximálni počet otázek pro')
        end
      end

      def get_questions_count_for_subject(subject_id)
        Question.where("subject_id = #{subject_id}").count('id')
      end
    end
  end
end