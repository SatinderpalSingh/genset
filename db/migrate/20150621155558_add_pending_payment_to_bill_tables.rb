class AddPendingPaymentToBillTables < ActiveRecord::Migration
  def change
    add_column :bill_tables, :pending_payment, :decimal, default: 0
	end
end
