json.array!(@bill_tables) do |bill_table|
  json.extract! bill_table, :id, :bill_id, :monthly_rent, :mail_sent, :third_party_payment, :owner_payment
  json.url bill_table_url(bill_table, format: :json)
end
