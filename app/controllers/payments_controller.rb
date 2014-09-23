class PaymentsController < ApplicationController

  def index
    @payments = Payment.where(customer_id: current_user.customer)
  end

  def new
  end

  def create

    # @amount = current_user.payment_plan * 100

    current_user.customer.create_stripe_customer params[:stripeToken]

    raise current_user.to_yaml

    # charge = Stripe::Charge.create(
    #   :customer => current_user.customer.stripe_customer_id,
    #   :amount   => @amount,
    #   :description => 'Test OfferShareNetwork Charge',
    #   :currency => 'usd'
    # )

    charge_hash = JSON.parse charge

    payment = Payment.new(
      :customer => current_user.customer.id,
      :amount => charge_hash.amount,
      :plan => current_user.customer.plan,
      :auth_code => charge_hash.id
    )
    payment.save
    redirect_to payments_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to payments_path
  end

  def test
  end

end
