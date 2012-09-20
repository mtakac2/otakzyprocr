module Map::MapHelper
  def populate_map(map_data, question = nil)
    counties_counter = 1
    populate = <<HEREDOC
      <script>
        var us_stats = {
HEREDOC

    Refinery::Counties::County.all.each do |county|
      
      question_total = 0
      question_data = ''
      question_counter = 1

      if question
        case map_data
          when :citizens
            for_question_in_county = county.count_citizens_for(question.id)
            for_question_total = CitizensQuestion.where('question_id = ?', question.id).count
          when :promised_hours
            for_question_in_county = county.count_promised_hours_for(question.id)
            for_question_total = CitizensQuestion.where('question_id = ?', question.id).sum(:hours)
          when :worked_hours
            for_question_in_county = county.count_worked_hours_for(question.id)
            for_question_total = CitizensQuestion.where('question_id = ?', question.id).sum(:hours_done)
        end

        unless for_question_in_county == 0
          question_total = 10000 / (for_question_total / for_question_in_county)                
        end

      else
        Refinery::Questions::Question.all.each do |question|
          case map_data
            when :citizens
              question_data += "q#{question_counter}:[#{county.percentage_of_citizens_for(question.id)}],"
            when :promised_hours
              question_data += "q#{question_counter}:[#{county.percentage_of_promised_hours_for(question.id)}],"
            when :worked_hours
              question_data += "q#{question_counter}:[#{county.percentage_of_worked_hours_for(question.id)}],"
          end
                    
          question_total = 5000 if county.percentage_of_citizens_for(question.id) > 0
          question_counter += 1
        end
      end

      county_code = county.code
      
      if counties_counter < Refinery::Counties::County.count
        populate += "'#{county_code}': {name:'#{county.name}', land:0, water:0, #{question_data} total:[#{question_total}]},\n"
      else
        populate += "'#{county_code}': {name:'#{county.name}', land:0, water:0, #{question_data} total:[#{question_total}]}"
      end
      
      counties_counter += 1
    end

    populate += <<HEREDOC
      }; 
      us_stats.maxYear = 2008;
      us_stats.minYear = 1995;
      us_stats.yearIdx = function(year) { return 2008-year; }
      </script>
HEREDOC

    raw(populate)
  end

  def generate_questions

  end
end