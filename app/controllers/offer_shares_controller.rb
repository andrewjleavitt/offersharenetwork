class OfferSharesController < ApplicationController
  before_action :set_offer_share, only: [:show, :edit, :update, :destroy]

  # GET /offer_shares
  # GET /offer_shares.json
  def index
    @offer_shares = OfferShare.all
  end

  # GET /offer_shares/1
  # GET /offer_shares/1.json
  def show
  end

  # GET /offer_shares/new
  def new
    @offers = Offer.all
    @advocates = Advocate.all
    @offer_share = OfferShare.new
  end

  # GET /offer_shares/1/edit
  def edit
  end

  # POST /offer_shares
  # POST /offer_shares.json
  def create
    @offer_share = OfferShare.new(offer_share_params)
    
    respond_to do |format|
      if @offer_share.save
        format.html { redirect_to @offer_share, notice: 'Offer share was successfully created.' }
        format.json { render :show, status: :created, location: @offer_share }
      else
        format.html { render :new }
        format.json { render json: @offer_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offer_shares/1
  # PATCH/PUT /offer_shares/1.json
  def update
    respond_to do |format|
      if @offer_share.update(offer_share_params)
        format.html { redirect_to @offer_share, notice: 'Offer share was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer_share }
      else
        format.html { render :edit }
        format.json { render json: @offer_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_shares/1
  # DELETE /offer_shares/1.json
  def destroy
    @offer_share.destroy
    respond_to do |format|
      format.html { redirect_to offer_shares_url, notice: 'Offer share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer_share
      @offer_share = OfferShare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_share_params
      params.require(:offer_share).permit(:offer_id, :advocate_id, :code)
    end
end
