class CreateOfferShares < ActiveRecord::Migration
  def change
    create_table :offer_shares do |t|
      t.references :offer, index: true
      t.references :advocate, index: true
      t.string :code

      t.timestamps
    end
  end
end
