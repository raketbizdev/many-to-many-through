json.array!(@clients) do |client|
  json.extract! client, :id, :full_name, :business_name
  json.url client_url(client, format: :json)
end
