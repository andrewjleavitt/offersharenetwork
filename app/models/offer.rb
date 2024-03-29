class Offer < ActiveRecord::Base
  belongs_to :customer
  has_many :offer_shares

  def offer_redemption_count
    redemptions = 0
    self.offer_shares.each do |offer_share|
      redemptions += offer_share.redemptions.count
    end

    return redemptions
  end

  def published?
    self.published.nil? == false ? true : false
  end

  def publish!
    self.publish = DateTime.now
    self.save
  end

end
