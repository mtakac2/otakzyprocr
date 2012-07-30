module Refinery
  module Citizens
    module Admin
      class CitizensController < ::Refinery::AdminController

        crudify :'refinery/citizens/citizen',
                :title_attribute => 'firstname', :xhr_paging => true

      end
    end
  end
end
