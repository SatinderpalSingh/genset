class AddCalcTotalToBillTables < ActiveRecord::Migration
  def change
		add_column :bill_tables, :calc_total, :decimal, precision: 10, scale: 2
  end
end
