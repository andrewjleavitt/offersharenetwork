class RemoveActiveFromOffers < ActiveRecord::Migration
  def change
    remove_column :offers, :active
    remove_column :offers, :expires
  end
end
