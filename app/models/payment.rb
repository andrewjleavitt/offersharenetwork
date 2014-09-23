class Payment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :payment_plan
end
