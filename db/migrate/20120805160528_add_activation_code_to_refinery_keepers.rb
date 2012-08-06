class AddActivationCodeToRefineryKeepers < ActiveRecord::Migration
  def change
    add_column :refinery_keepers, :activation_code, :string
  end
end
