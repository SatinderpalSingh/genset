json.array!(@third_party_providers) do |third_party_provider|
  json.extract! third_party_provider, :id, :name, :address, :contactNo
  json.url third_party_provider_url(third_party_provider, format: :json)
end
