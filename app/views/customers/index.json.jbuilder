json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :description, :active, :logo_url
  json.url customer_url(customer, format: :json)
end
