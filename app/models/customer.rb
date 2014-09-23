class Customer < ActiveRecord::Base
  has_many :offers
  has_one :user
  belongs_to :payment_plans
  has_many :payments

  def create_stripe_customer stripe_token
    stripe_customer = Stripe::Customer.create(
      :description => "OfferShareNetwork Customer",
      :card => stripe_token,
      :plan => "monthly"
    )
    stripe_customer_hash = JSON.parse(stripe_customer.to_s)
    raise stripe_customer_hash.to_yaml
    self.stripe_customer_id = 0
    self.save
  end

  def get_stripe_customer
    Stripe::Customer.retrieve self.stripe_customer_id
  end

  def paid?
    self.active == true ? true : false
  end

end
