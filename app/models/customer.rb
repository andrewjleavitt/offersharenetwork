class Customer < ActiveRecord::Base
  has_many :offers
  has_one :user
end
