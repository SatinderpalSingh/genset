class AddPaymentTypeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :payment_type, :varchar
  end
end
