class ChangeContactNoInClientDetails < ActiveRecord::Migration
  def change
		change_column :client_details, :contactNo, :bigint
  end
end
