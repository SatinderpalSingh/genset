class AddTransactionRemarksToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :transaction_remarks, :varchar
  end
end
