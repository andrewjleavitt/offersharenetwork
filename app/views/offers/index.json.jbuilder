json.array!(@offers) do |offer|
  json.extract! offer, :id, :customer_id, :name, :description, :reward_description, :reward_factor, :redemption_value, :active, :image_url, :published, :expires
  json.url offer_url(offer, format: :json)
end
