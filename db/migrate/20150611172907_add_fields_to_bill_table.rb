class AddFieldsToBillTable < ActiveRecord::Migration
  def change
    add_column :bill_tables, :bank_branch, :varchar
    add_column :bill_tables, :gen_desc, :varchar
    add_column :bill_tables, :rate, :varchar
    add_column :bill_tables, :quantity, :varchar
    add_column :bill_tables, :service_tax, :varchar
    add_column :bill_tables, :surcharge, :varchar
    add_column :bill_tables, :date, :date
    add_column :bill_tables, :bill_no, :integer
  end
end
