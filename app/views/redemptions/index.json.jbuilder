json.array!(@redemptions) do |redemption|
  json.extract! redemption, :id, :offer_share_id
  json.url redemption_url(redemption, format: :json)
end
