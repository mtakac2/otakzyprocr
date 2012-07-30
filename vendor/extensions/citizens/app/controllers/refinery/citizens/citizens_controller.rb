module Refinery
  module Citizens
    class CitizensController < ::ApplicationController

      before_filter :find_all_citizens
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @citizen in the line below:
        present(@page)
      end

      def show
        @citizen = Citizen.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @citizen in the line below:
        present(@page)
      end

    protected

      def find_all_citizens
        @citizens = Citizen.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/citizens").first
      end

    end
  end
end
