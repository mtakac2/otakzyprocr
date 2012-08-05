module Refinery
  module Elections
    class ElectionsController < ::ApplicationController

      before_filter :find_all_elections
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @election in the line below:
        present(@page)
      end

      def show
        @election = Election.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @election in the line below:
        present(@page)
      end

    protected

      def find_all_elections
        @elections = Election.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/elections").first
      end

    end
  end
end
