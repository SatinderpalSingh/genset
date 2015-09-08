json.array!(@gen_expenses) do |gen_expense|
  json.extract! gen_expense, :id, :date, :reading, :readingBy, :batteryStatus, :radiatorStatus, :dieselCharge, :otherExpenses, :client_detail_id
  json.url gen_expense_url(gen_expense, format: :json)
end
