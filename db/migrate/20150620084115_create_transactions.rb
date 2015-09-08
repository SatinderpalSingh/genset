class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :bill_id
      t.integer :amount
      t.date :date

      t.timestamps null: false
    end
  end
end
