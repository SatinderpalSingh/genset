class AddBankNameToBillTables < ActiveRecord::Migration
  def change
    add_column :bill_tables, :bank_name, :string
  end
end
