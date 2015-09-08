class CreateGenExpenses < ActiveRecord::Migration
  def change
    create_table :gen_expenses do |t|
      t.date   :date
      t.string :reading
      t.string :readingBy
      t.string :batteryStatus
      t.string :radiatorStatus
      t.decimal :dieselCharge
      t.decimal :otherExpenses
      t.references :client_detail, index: true

      t.timestamps null: false
    end
    add_foreign_key :gen_expenses, :client_details
  end
end
