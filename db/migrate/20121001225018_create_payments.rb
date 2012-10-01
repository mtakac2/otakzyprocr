class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :hours
      t.float :total

      t.timestamps
    end
  end
end
