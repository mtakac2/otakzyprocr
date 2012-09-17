module Refinery
  module Citizens
    module Admin
      class CitizensController < ::Refinery::AdminController

        crudify :'refinery/citizens/citizen',
                :title_attribute => 'firstname', :xhr_paging => true


        def edit
          @citizen = Citizen.find(params[:id])
          @citizens_questions = @citizen.questions
        end

        def update          
          @citizen_question = CitizensQuestion.where('citizen_id = ? AND question_id = ?', params[:id], params[:question][:id]).first
          if @citizen_question.update_attributes(teamleader: 1)
            redirect_to refinery.citizens_admin_citizens_path, :notice => "'#{@citizen.email}' is now teamleader."
          else
            render 'edit'
          end
        end
      end
    end
  end
end
