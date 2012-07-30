require 'spec_helper'

module Refinery
  module Citizens
    describe Citizen do
      describe "validations" do
        subject do
          FactoryGirl.create(:citizen,
          :firstname => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:firstname) { should == "Refinery CMS" }
      end
    end
  end
end
