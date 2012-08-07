module Refinery
  module Emails
    module Admin
      class EmailsController < ::Refinery::AdminController

        crudify :'refinery/emails/email', :xhr_paging => true

      end
    end
  end
end
