module Refinery
  module Questions
    module Admin
      class QuestionsController < ::Refinery::AdminController        
        before_filter :find_citizens_questions, only: :index

        crudify :'refinery/questions/question', :xhr_paging => true          

        def edit
          @question = Question.find(params[:id])
          @citizens = @question.citizens
        end

        def update
          @question = Question.find(params[:id])
          if params[:citizens_question][:teamleader].to_i > 0
            @citizens_question = CitizensQuestion.where('citizen_id = ? AND question_id = ?', params[:citizens_question][:teamleader], @question.id).first
          end

          if @question.update_attributes(params[:question])
            if @citizens_question.update_attributes(teamleader: 1)
              CitizensQuestion.where('question_id = ? AND citizen_id != ? AND teamleader = 1', @question.id, params[:citizens_question][:teamleader]).each do |c|
                c.update_attributes(teamleader: 0)
              end
            end
            redirect_to refinery.questions_admin_questions_path, notice: 'Updated.'
          else
            render 'edit'
          end
        end

        protected 

          def find_citizens_questions
            @citizens_questions = CitizensQuestion.order('created_at')
          end
      end
    end
  end
end
