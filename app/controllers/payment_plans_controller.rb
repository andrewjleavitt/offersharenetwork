class PaymentPlansController < ApplicationController
  before_action :set_payment_plan, only: [:show, :edit, :update, :destroy]

  # GET /payment_plans
  # GET /payment_plans.json
  def index
    @payment_plans = PaymentPlan.all
  end

  # GET /payment_plans/1
  # GET /payment_plans/1.json
  def show
  end

  # GET /payment_plans/new
  def new
    @payment_plan = PaymentPlan.new
  end

  # GET /payment_plans/1/edit
  def edit
  end

  # POST /payment_plans
  # POST /payment_plans.json
  def create
    @payment_plan = PaymentPlan.new(payment_plan_params)

    respond_to do |format|
      if @payment_plan.save
        redirect_to @payment_plan, notice: 'Payment plan was successfully created.'
      else
        render :new
      end
    end
  end

  def select
    @payment_plan = PaymentPlan.find(params[:id])
    current_user.customer.payment_plan_id = @payment_plan
    redirect_to payments_path, notice: 'Payment plan was successfully updated. Please enter payment information'
  end

  # PATCH/PUT /payment_plans/1
  # PATCH/PUT /payment_plans/1.json
  def update
    respond_to do |format|
      if @payment_plan.update(payment_plan_params)
        redirect_to @payment_plan, notice: 'Payment plan was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /payment_plans/1
  # DELETE /payment_plans/1.json
  def destroy
    @payment_plan.destroy
    respond_to do |format|
      redirect_to payment_plans_url, notice: 'Payment plan was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_plan
      @payment_plan = PaymentPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_plan_params
      params.require(:payment_plan).permit(:name, :description, :amount, :billing_period, :stripe_id)
    end
end
