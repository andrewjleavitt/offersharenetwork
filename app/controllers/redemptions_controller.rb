class RedemptionsController < ApplicationController
  before_action :set_redemption, only: [:show, :edit, :update, :destroy]

  # GET /redemptions
  # GET /redemptions.json
  def index
    # @redemptions = Redemption.all
    @redemption = Redemption.new
  end

  # GET /redemptions/1
  # GET /redemptions/1.json
  def show
  end

  # GET /redemptions/new
  def new
    @redemption = Redemption.new
  end

  # GET /redemptions/1/edit
  def edit
  end

  # POST /redemptions
  # POST /redemptions.json
  def create
    # raise redemption_params['offer_share_code'].to_yaml
    @offer_share = OfferShare.find_by(code: redemption_params['offer_share_code'])

    @redemption = Redemption.new({
      offer_share: @offer_share
    })

    if @redemption.save
      redirect_to @redemption, notice: 'Redemption was successfully created.'
    else
      render :new, notice: 'Unable to save redemption.'
    end
  end

  # PATCH/PUT /redemptions/1
  # PATCH/PUT /redemptions/1.json
  def update
    respond_to do |format|
      if @redemption.update(redemption_params)
        format.html { redirect_to @redemption, notice: 'Redemption was successfully updated.' }
        format.json { render :show, status: :ok, location: @redemption }
      else
        format.html { render :edit }
        format.json { render json: @redemption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redemptions/1
  # DELETE /redemptions/1.json
  def destroy
    @redemption.destroy
    respond_to do |format|
      format.html { redirect_to redemptions_url, notice: 'Redemption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redemption
      @redemption = Redemption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redemption_params
      params.permit(:offer_share_code)
    end
end
