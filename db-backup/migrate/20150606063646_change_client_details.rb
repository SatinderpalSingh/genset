class ChangeClientDetails < ActiveRecord::Migration
  def change
    add_column :client_details, :bank_id, :integer
		add_foreign_key :banks, :client_details
  end
end
