class ChangeContactNoInSenderDetails < ActiveRecord::Migration
  def change
		change_column :sender_details, :contactNo, :bigint
  end
end
