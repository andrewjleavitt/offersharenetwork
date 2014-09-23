class PaymentPlan < ActiveRecord::Base
  has_many :customers
  has_many :payments
end
