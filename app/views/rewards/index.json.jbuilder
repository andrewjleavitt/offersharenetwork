json.array!(@rewards) do |reward|
  json.extract! reward, :id, :offer_share_id, :rewarded_on
  json.url reward_url(reward, format: :json)
end
