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

      # validate :email_availability
      validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      # validates_length_of :password, :minimum => 6
      validates_presence_of :firstname, :lastname, :email

      def create_activation_code
        self.activation_code = SecureRandom.urlsafe_base64(64)
      end

      def email_availability
        if Refinery::Citizens::Citizen.find_by_email(email) || Keeper.find_by_email(email)
          errors.add(:email, 'email is taken.')
        end
      end

      def has_password?
        true if self.password_digest        
      end
    end
  end
end