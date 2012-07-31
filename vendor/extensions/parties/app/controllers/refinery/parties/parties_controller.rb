module Refinery
  module Parties
    class PartiesController < ::ApplicationController

      before_filter :find_all_parties
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @party in the line below:
        present(@page)
      end

      def show
        @party = Party.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @party in the line below:
        present(@page)
      end

    protected

      def find_all_parties
        @parties = Party.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/parties").first
      end

    end
  end
end
