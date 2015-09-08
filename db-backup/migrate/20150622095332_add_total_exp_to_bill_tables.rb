class AddTotalExpToBillTables < ActiveRecord::Migration
  def change
		add_column :bill_tables, :total_exp, :decimal
  end
end
