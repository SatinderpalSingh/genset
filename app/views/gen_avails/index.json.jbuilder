json.array!(@gen_avails) do |gen_avail|
  json.extract! gen_avail, :id
  json.url gen_avail_url(gen_avail, format: :json)
end
