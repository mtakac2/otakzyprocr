class Stat  
  include ActiveModel::Conversion
  extend ActiveModel::Naming  

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat( vars )
    super
  end

 def self.attributes
   @attributes
 end

 def initialize(attributes={})
   attributes && attributes.each do |name, value|
     send("#{name}=", value) if respond_to? name.to_sym 
   end
 end

  def persisted?
    false
  end

  def self.inspect
    "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
  end

  def questions_count
    Refinery::Questions::Question.count
  end

  def citizens_count
    Refinery::Citizens::Citizen.count
  end

  def politicians_count
    Refinery::Politicians::Politician.count
  end

  def citizens_men_count
    Refinery::Citizens::Citizen.where("gender = 'male'").count
  end

  def citizens_women_count
    Refinery::Citizens::Citizen.where("gender = 'female'").count
  end

  def promised_workhours_sum
    CitizensQuestion.sum('hours')
  end

  def done_workhours_sum
    CitizensQuestion.sum('hours_done')
  end

  def citizens_average_age
    Refinery::Citizens::Citizen.average('age').round(2)
  end

  def team_count
    CitizensQuestion.find_by_sql("
      SELECT COUNT (DISTINCT question_id)
      FROM citizens_questions"      
    ).first.count
  end

  def questions_without_team_count
    result = Refinery::Questions::Question.count - self.team_count.to_i
    if Refinery::Questions::Question.count - self.team_count.to_i < 0
      result = 0
    end
    result
  end

  def percent_of_citizens
    (Refinery::Citizens::Citizen.count('id') / (8415892 / 100)).round(5)
  end

  def county_with_most_citizens
    @citizens_count = 0
    Refinery::Counties::County.all.each do |county|      
      if county.citizens.count > @citizens_count
        @county = { citizens_count: county.citizens.count, name: county.name }        
      end      
    end
    if !@county.nil?
      return @county
    end
    nil
  end

  def count_team_exits
    TeamExit.count
  end

  def question_with_highest_exit_rate
    team_exit = TeamExit.group(:question_id).count(:citizen_id).max
    if !team_exit.nil?
      return exits = { question: Refinery::Questions::Question.find(team_exit[0].to_i), count: team_exit[1].to_i }
    end
    nil
  end

  def adepts_for_reward
    citizen_question = CitizensQuestion.group(:citizen_id).sum(:hours).max
    if !citizen_question.nil?
      return adept = { citizen: Refinery::Citizens::Citizen.find(citizen_question[0]), hours: citizen_question[1] }
    end
    nil
  end

  def reward_fond_amount
    Payment.sum(:total)
  end
end