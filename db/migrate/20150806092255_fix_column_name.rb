class FixColumnName < ActiveRecord::Migration
  def change
	  rename_column :service_hours, :hours_left, :working_hours
 	end
end
