module Refinery
  module Parties
    module Admin
      class PartiesController < ::Refinery::AdminController

        crudify :'refinery/parties/party',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
