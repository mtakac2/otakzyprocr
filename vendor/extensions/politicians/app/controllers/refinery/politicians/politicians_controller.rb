module Refinery
  module Politicians
    class PoliticiansController < ::ApplicationController

      before_filter :find_all_politicians
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @politician in the line below:
        present(@page)
      end

      def show
        @politician = Politician.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @politician in the line below:
        present(@page)
      end

    protected

      def find_all_politicians
        @politicians = Politician.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/politicians").first
      end

    end
  end
end
