class AddPaymentPlanIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :payment_plan_id, :integer
    add_column :customers, :payment_due_date, :date
  end
end
