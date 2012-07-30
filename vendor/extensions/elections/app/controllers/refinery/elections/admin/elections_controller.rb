module Refinery
  module Elections
    module Admin
      class ElectionsController < ::Refinery::AdminController

        crudify :'refinery/elections/election', :xhr_paging => true

      end
    end
  end
end
