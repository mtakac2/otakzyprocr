# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Elections" do
    describe "Admin" do
      describe "elections" do
        login_refinery_user

        describe "elections list" do
          before(:each) do
            FactoryGirl.create(:election, :title => "UniqueTitleOne")
            FactoryGirl.create(:election, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.elections_admin_elections_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.elections_admin_elections_path

            click_link "Add New Election"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Elections::Election.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Elections::Election.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:election, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.elections_admin_elections_path

              click_link "Add New Election"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Elections::Election.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:election, :title => "A title") }

          it "should succeed" do
            visit refinery.elections_admin_elections_path

            within ".actions" do
              click_link "Edit this election"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:election, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.elections_admin_elections_path

            click_link "Remove this election forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Elections::Election.count.should == 0
          end
        end

      end
    end
  end
end
