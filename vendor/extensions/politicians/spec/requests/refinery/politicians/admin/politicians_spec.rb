# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Politicians" do
    describe "Admin" do
      describe "politicians" do
        login_refinery_user

        describe "politicians list" do
          before(:each) do
            FactoryGirl.create(:politician, :firstname => "UniqueTitleOne")
            FactoryGirl.create(:politician, :firstname => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.politicians_admin_politicians_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.politicians_admin_politicians_path

            click_link "Add New Politician"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Firstname", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Politicians::Politician.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Firstname can't be blank")
              Refinery::Politicians::Politician.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:politician, :firstname => "UniqueTitle") }

            it "should fail" do
              visit refinery.politicians_admin_politicians_path

              click_link "Add New Politician"

              fill_in "Firstname", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Politicians::Politician.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:politician, :firstname => "A firstname") }

          it "should succeed" do
            visit refinery.politicians_admin_politicians_path

            within ".actions" do
              click_link "Edit this politician"
            end

            fill_in "Firstname", :with => "A different firstname"
            click_button "Save"

            page.should have_content("'A different firstname' was successfully updated.")
            page.should have_no_content("A firstname")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:politician, :firstname => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.politicians_admin_politicians_path

            click_link "Remove this politician forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Politicians::Politician.count.should == 0
          end
        end

      end
    end
  end
end
