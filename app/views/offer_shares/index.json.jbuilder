json.array!(@offer_shares) do |offer_share|
  json.extract! offer_share, :id, :offer_id, :advocate_id, :code
  json.url offer_share_url(offer_share, format: :json)
end
