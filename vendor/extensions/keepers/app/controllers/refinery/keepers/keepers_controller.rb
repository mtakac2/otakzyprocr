module Refinery
  module Keepers
    class KeepersController < ::ApplicationController

      before_filter :find_all_keepers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @keeper in the line below:
        present(@page)
      end

      def show
        @keeper = Keeper.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @keeper in the line below:
        present(@page)
      end

    protected

      def find_all_keepers
        @keepers = Keeper.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/keepers").first
      end

    end
  end
end
