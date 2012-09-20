module Refinery
  module Counties
    class County < Refinery::Core::BaseModel
      self.table_name = 'refinery_counties'
      has_many :citizens, class_name: 'Refinery::Citizens::Citizen'

      attr_accessible :name, :position, :code, :borders

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true      

      def count_citizens        
        self.citizens.count
      end

      def count_citizens_for(question_id)
        count = 0
        self.citizens.each do |citizen|
          count += citizen.questions.where('question_id = ?', question_id).count
        end
        count.to_f
      end

      def percentage_of_citizens_for(question_id)
        percentage = 0
        if self.count_citizens > 0
          percentage = (self.count_citizens_for(question_id) / self.count_citizens) * 100
        end
        percentage.round(2)
      end

      def count_promised_hours
        count = 0
        self.citizens.each do |citizen|
          count += CitizensQuestion.where('citizen_id = ?', citizen.id).sum(:hours) 
        end
        count
      end

      def count_promised_hours_for(question_id)
        count = 0
        self.citizens.each do |citizen|
          count += CitizensQuestion.where('citizen_id = ? AND question_id = ?', citizen.id, question_id).sum(:hours)
        end
        count.to_f
      end

      def percentage_of_promised_hours_for(question_id)
        percentage = 0
        if self.count_promised_hours > 0
          percentage = (self.count_promised_hours_for(question_id) / self.count_promised_hours) * 100          
        end
        percentage.round(2)
      end

      def count_worked_hours
        count = 0
        self.citizens.each do |citizen|
          count += CitizensQuestion.where('citizen_id = ?', citizen.id).sum(:hours_done) 
        end
        count
      end

      def count_worked_hours_for(question_id)
        count = 0
        self.citizens.each do |citizen|
          count += CitizensQuestion.where('citizen_id = ? AND question_id = ?', citizen.id, question_id).sum(:hours_done)
        end
        count.to_f
      end

      def percentage_of_worked_hours_for(question_id)
        percentage = 0
        if self.count_promised_hours > 0
          percentage = (self.count_worked_hours_for(question_id) / self.count_worked_hours) * 100          
        end
        percentage.round(2)
      end
    end
  end
end
