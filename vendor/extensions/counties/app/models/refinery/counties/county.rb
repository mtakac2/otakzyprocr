module Refinery
  module Counties
    class County < Refinery::Core::BaseModel
      self.table_name = 'refinery_counties'
      has_many :citizens, class_name: 'Refinery::Citizens::Citizen'

      attr_accessible :name, :position, :code, :borders

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      
      def count_all_questions_in_county
        citizens = self.citizens
        count = 0

        citizens.each do |citizen|
          count = count + citizen.questions.count
        end

        return count
      end

      def count_citizens_solving_question(question_id)
        citizens = self.citizens
        count = 0

        citizens.each do |citizen|
          questions = citizen.questions

          questions.each do |question|
            if question.id == question_id
              count = count + 1
            end
          end
        end

        return count
      end

      def get_percents_for_question(question_id)
        if self.count_all_questions_in_county > 0
          x = (self.count_citizens_solving_question(question_id).to_f / self.count_all_questions_in_county) * 100
          return x
        end
        0        
      end

    end
  end
end
