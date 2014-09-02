class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.references :offer_share, index: true
      t.datetime :rewarded_on

      t.timestamps
    end
  end
end
