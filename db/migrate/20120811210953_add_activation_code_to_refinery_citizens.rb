class AddActivationCodeToRefineryCitizens < ActiveRecord::Migration
  def change
    add_column :refinery_citizens, :activation_code, :string
  end
end
