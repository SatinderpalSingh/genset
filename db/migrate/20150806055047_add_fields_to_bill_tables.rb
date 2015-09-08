class AddFieldsToBillTables < ActiveRecord::Migration
  def change
		add_column :bill_tables, :calc_stax, :decimal, precision: 10, scale: 2
		add_column :bill_tables, :calc_tds, :decimal, precision: 10, scale: 2
		add_column :bill_tables, :calc_surcharge, :decimal, precision: 10, scale: 2
  end
end
