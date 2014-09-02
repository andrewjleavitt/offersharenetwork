json.array!(@advocates) do |advocate|
  json.extract! advocate, :id, :name, :email
  json.url advocate_url(advocate, format: :json)
end
