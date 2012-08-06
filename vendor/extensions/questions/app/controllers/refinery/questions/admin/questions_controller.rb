module Refinery
  module Questions
    module Admin
      class QuestionsController < ::Refinery::AdminController

        crudify :'refinery/questions/question', :xhr_paging => true

      end
    end
  end
end
