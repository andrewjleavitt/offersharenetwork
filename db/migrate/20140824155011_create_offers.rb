class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :customer, index: true
      t.string :name
      t.string :description
      t.string :reward_description
      t.string :reward_factor
      t.string :redemption_value
      t.boolean :active
      t.string :image_url
      t.date :published
      t.date :expires

      t.timestamps
    end
  end
end
