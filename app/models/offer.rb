class Offer < ActiveRecord::Base
  belongs_to :customer
  has_many :offer_shares

  def offer_redemption_count
    
  end
end
