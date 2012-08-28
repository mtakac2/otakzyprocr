require 'spec_helper'

describe "HomePage" do  
  it "should return success status" do
    get '/'
    response.status.should be(200)
  end

  it "should lists all strategic questions" do
        
  end  
end