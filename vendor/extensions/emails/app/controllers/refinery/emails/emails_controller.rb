module Refinery
  module Emails
    class EmailsController < ::ApplicationController

      before_filter :find_all_emails
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @email in the line below:
        present(@page)
      end

      def show
        @email = Email.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @email in the line below:
        present(@page)
      end

    protected

      def find_all_emails
        @emails = Email.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/emails").first
      end

    end
  end
end
