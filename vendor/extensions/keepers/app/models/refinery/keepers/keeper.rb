module Refinery
  module Keepers
    class Keeper < Refinery::Core::BaseModel
      self.table_name = 'refinery_keepers'

      has_secure_password

      attr_accessible :firstname, :lastname, :email, :password, :password_confirmation,
       :street, :street_number, :postal_code, :city, :phone, :position

      acts_as_indexed :fields => [:firstname, :lastname, :email, :street, :postal_code, :city, :phone]

      has_many :subjects
    end
  end
end