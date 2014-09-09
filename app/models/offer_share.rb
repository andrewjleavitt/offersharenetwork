class OfferShare < ActiveRecord::Base
  belongs_to :offer
  belongs_to :advocate
  has_many :redemptions

  validates :code, uniqueness: true

  before_create :create_code

  protected
    def create_code
      self.code = ('a'..'z').to_a.shuffle[0,3].join + '-' + ('a'..'z').to_a.shuffle[0,3].join
      # probably not a long term solution
      self.create_code unless self.valid?
    end
end
