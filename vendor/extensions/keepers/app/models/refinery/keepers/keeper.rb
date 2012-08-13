module Refinery
  module Keepers
    class Keeper < Refinery::Core::BaseModel
      self.table_name = 'refinery_keepers'

      has_secure_password

      attr_accessible :firstname, :lastname, :email, :password, :password_confirmation,
       :street, :street_number, :postal_code, :city, :phone, :position, :activation_code, :old_password

      attr_accessor :old_password

      acts_as_indexed :fields => [:firstname, :lastname, :email, :street, :postal_code, :city, :phone]

      has_many :subjects

      before_create :create_activation_code

      def create_activation_code
        self.activation_code = SecureRandom.urlsafe_base64(64)
      end      
    end
  end
end