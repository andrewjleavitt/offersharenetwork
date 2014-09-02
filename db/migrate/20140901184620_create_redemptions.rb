class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.references :offer_share, index: true

      t.timestamps
    end
  end
end
