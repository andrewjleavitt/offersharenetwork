json.array!(@payment_plans) do |payment_plan|
  json.extract! payment_plan, :id, :name, :description, :amount, :billing_period, :stripe_id
  json.url payment_plan_url(payment_plan, format: :json)
end
