class CitizensQuestion < ActiveRecord::Base
  attr_accessible :citizen_id, :hours, :hours_done, :question_id
  belongs_to :citizen, :class_name => 'Refinery::Citizens::Citizen'
  belongs_to :question, :class_name => 'Refinery::Questions::Question'

  def can_add_hours?
  	return true if self.hours == self.hours_done
  end

  def paypal_url(return_url)
    values = {
      :business => '&rsquo;seller_1234111143_biz@asciicasts.com&rsquo;',
      :cmd => '&rsquo;_cart&rsquo;',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :amount => 5,
      :item_name => 'hours',
      :item_quantity => self.hours
    }      
   
    "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=otazkyprocr@mail.com&item_name=Hours&amount=5&quantity=50&currency_code=CZK&return_url=www.google.com"
  end
end