# encoding: UTF-8

module Refinery
  module Citizens
    class Citizen < Refinery::Core::BaseModel
      self.table_name = 'refinery_citizens'
      has_secure_password
      attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :street, :street_number, :postal_code, :city, :county_id, :gender, :age, :position      

      attr_writer :current_step

      acts_as_indexed :fields => [:firstname, :lastname, :email, :street, :postal_code, :city, :gender]

      validate :email_availability, :if => :user_step?
      validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
        :message => 'musí být ve tvaru email@example.com', :if => :user_step?
      validates_length_of :password, :minimum => 6, :message => 'musí být alespoň 6 znaků dlouhé',
        :if => :user_step?      

      validates_presence_of :county_id, :message => 'je povinný',
        :if => :personal_step?
      validates_presence_of :gender, :message => 'výběr pohlaví je povinný',
        :if => :personal_step?
      validates_presence_of :age, :message => 'je povinný',
        :if => :personal_step?
      validates_numericality_of :age, :message => 'musí být číslo',
        :if => :personal_step?

      def steps
        %w[user personal question]
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

      def question_step?
        current_step == 'question'
      end

      def all_valid?
        steps.all? do |step|
          self.current_step = step
          valid?
        end
      end

      def email_availability
        if Citizen.find_by_email(email) || Refinery::Keepers::Keeper.find_by_email(email)
          errors.add(:email, 'uživatel se zadaným emailem už existuje')
        end
      end
    end
  end
end