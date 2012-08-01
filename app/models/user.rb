class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :password, :subtype
end
