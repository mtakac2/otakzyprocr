class AddPartnerToCitizensQuestion < ActiveRecord::Migration
  def change
    add_column :citizens_questions, :partner_id, :integer
  end
end