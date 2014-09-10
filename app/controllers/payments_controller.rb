class PaymentsController < ApplicationController

  def new
  end

  def create
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'andyleavitt@gmail.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount   => @amount,
      :description => 'Test Stripe Customer',
      :currency => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to payments_path
  end

end
