class Redemption < ActiveRecord::Base
  belongs_to :offer_share
  validates :offer_share, presence: true
end
