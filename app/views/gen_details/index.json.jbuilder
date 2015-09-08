json.array!(@gen_details) do |gen_detail|
  json.extract! gen_detail, :id, :genType, :genRent, :totalGen
  json.url gen_detail_url(gen_detail, format: :json)
end
