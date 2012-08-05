# encoding: UTF-8

module Refinery
  module Citizens
    class Citizen < Refinery::Core::BaseModel
      self.table_name = 'refinery_citizens'
      has_secure_password
      attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :street, :street_number, :postal_code, :city, :county_id, :gender, :age, :position

      attr_writer :current_step

      acts_as_indexed :fields => [:firstname, :lastname, :email, :street, :postal_code, :city, :gender]

      validates_presence_of :email, :message => 'Zadejte prosím email',
            :if => :user_step?
          validates_uniqueness_of :email, :message => 'Uživatel se zadaným emailem už existuje',
            :if => :user_step?
          validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
            :message => 'Email musí být ve tvaru email@example.com', :if => :user_step?
          validates_presence_of :password, :message => 'Zadejte prosím heslo',
            :if => :user_step?

      def steps
        %w[user personal]
      end

      def current_step
        @current_step || steps.first
      end

      def next_step
        self.current_step = steps[steps.index(current_step) + 1]
      end

      def previous_step
        self.current_step = steps[steps.index(current_step) - 1]
      end

      def first_step?
        current_step == steps.first
      end

      def last_step?
        current_step == steps.last
      end

      def user_step?
        current_step == 'user'
      end

      def personal_step?
        current_step == 'personal'
      end

      def all_valid?
        steps.all? do |step|
          self.current_step = step
          valid?
        end
      end
    end
  end
end