class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_filter :validate_customer

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.where(customer: current_user.customer)
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.customer_id = current_user.customer_id
    redirect_to @offer, notice: 'Offer was successfully created.'
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      redirect_to offers_url, notice: 'Offer was successfully destroyed.'
    end
  end

  def publish
    # check to see if customer is paid
    @offer = Offer.find(params[:id])

    if current_user.customer.paid?
      @offer.publish!
      redirect_to @offer, notice: 'Offer was successfully published.'
    else
      redirect_to @offer, notice: 'Offer not published. Please update payment information to publish your offer.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:name, :description, :reward_description, :reward_factor, :redemption_value, :active, :image_url, :published, :expires)
    end
end
