json.array!(@payments) do |payment|
  json.extract! payment, :id, :customer_id, :payment_plan_id, :amount, :auth_code
  json.url payment_url(payment, format: :json)
end
