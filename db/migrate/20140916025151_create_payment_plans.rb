class CreatePaymentPlans < ActiveRecord::Migration
  def change
    create_table :payment_plans do |t|
      t.string :name
      t.string :description
      t.string :amount
      t.string :billing_period
      t.string :stripe_id

      t.timestamps
    end
  end
end
