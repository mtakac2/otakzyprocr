class AddPasswordResetToRefineryCitizens < ActiveRecord::Migration
  def change
    add_column :refinery_citizens, :password_reset_token, :string    
    add_column :refinery_citizens, :password_reset_sent_at, :datetime
  end
end
