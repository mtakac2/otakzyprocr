module Refinery
  module Politicians
    module Admin
      class PoliticiansController < ::Refinery::AdminController

        crudify :'refinery/politicians/politician',
                :title_attribute => 'firstname', :xhr_paging => true

      end
    end
  end
end
