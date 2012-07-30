# encoding: UTF-8

module Refinery
  module Citizens
    class Citizen < Refinery::Core::BaseModel
      self.table_name = 'refinery_citizens'
      belongs_to :county, :class_name => 'Refinery::Counties::County'

      has_secure_password
      
      attr_accessible :firstname, :lastname, :email, :age, :county_id, :sex, :position, :password, :password_confirmation
      attr_writer :current_step

      acts_as_indexed :fields => [:firstname, :lastname, :email, :password_digest, :sex]

      validates_presence_of :email, :message => 'Zadejte prosím email',
        :if => :user_step?
      validates_uniqueness_of :email, :message => 'Uživatel se zadaným emailem už existuje',
        :if => :user_step?
      validates_format_of :email, :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
        :message => 'Email musí být ve tvaru email@example.com', :if => :user_step?
      validates_presence_of :password, :message => 'Zadejte prosím heslo',
        :if => :user_step?
      validates_presence_of :county_id, :message => 'Vyberte prosím okres',
        :if => :personal_step?
      validates_presence_of :sex, :message => 'Vyberte prosím pohlaví',
        :if => :personal_step?
      validates_presence_of :age, :message => 'Zadejte prosím věk',
        :if => :personal_step?                  

      def current_step
        @current_step || steps.first
      end

      def steps
        %w[user personal]
      end

      def next_step
        self.current_step = steps[steps.index(current_step) + 1]
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