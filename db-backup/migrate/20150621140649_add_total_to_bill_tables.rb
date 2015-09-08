class AddTotalToBillTables < ActiveRecord::Migration
  def change
    add_column :bill_tables, :total, :decimal
  end
end
