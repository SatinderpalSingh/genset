class AddColumnMonthlySalaryToGaurdDetails < ActiveRecord::Migration
  def change
    add_column :gaurd_details, :monthlySalary, :decimal, precision: 10, scale: 2
  end
end
