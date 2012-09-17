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
    Refinery::Questions::Question.count - self.team_count.to_i
  end

  def percent_of_citizens
    (Refinery::Citizens::Citizen.count('id') / (8415892 / 100)).round(2)
  end
end