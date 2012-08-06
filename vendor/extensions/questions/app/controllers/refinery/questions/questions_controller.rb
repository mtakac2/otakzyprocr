module Refinery
  module Questions
    class QuestionsController < ::ApplicationController

      before_filter :find_all_questions
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @question in the line below:
        present(@page)
      end

      def show
        @question = Question.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @question in the line below:
        present(@page)
      end

    protected

      def find_all_questions
        @questions = Question.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/questions").first
      end

    end
  end
end
