class AddTdsToBillTables < ActiveRecord::Migration
  def change
    add_column :bill_tables, :tds, :decimal
  end
end
