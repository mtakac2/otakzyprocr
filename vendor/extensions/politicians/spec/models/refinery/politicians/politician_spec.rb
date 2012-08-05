require 'spec_helper'

module Refinery
  module Politicians
    describe Politician do
      describe "validations" do
        subject do
          FactoryGirl.create(:politician,
          :firstname => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:firstname) { should == "Refinery CMS" }
      end
    end
  end
end
