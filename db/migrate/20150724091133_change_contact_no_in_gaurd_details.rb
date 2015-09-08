class ChangeContactNoInGaurdDetails < ActiveRecord::Migration
  def change
		change_column :gaurd_details, :contactNo, :bigint
  end
end
