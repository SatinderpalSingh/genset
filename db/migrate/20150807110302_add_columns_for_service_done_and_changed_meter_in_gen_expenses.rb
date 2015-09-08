class AddColumnsForServiceDoneAndChangedMeterInGenExpenses < ActiveRecord::Migration
  def change
		add_column :gen_expenses, :serviced, :boolean, :default => false 
		add_column :gen_expenses, :hour_meter_set, :boolean, :default => false
  end
end
