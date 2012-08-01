class User < ActiveRecord::Base
  acts_as_superclass
  has_secure_password
  attr_accessible :email, :firstname, :lastname, :password, :password_confirmation, :subtype
  attr_writer :current_step

  validates_presence_of :email, :if => :user_step?
  validates_presence_of :password, :if => :user_step?

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[user personal]
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
