class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :customer, index: true
      t.references :payment_plan, index: true
      t.integer :amount
      t.string :auth_code

      t.timestamps
    end
  end
end
