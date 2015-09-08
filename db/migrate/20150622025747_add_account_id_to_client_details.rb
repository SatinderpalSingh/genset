class AddAccountIdToClientDetails < ActiveRecord::Migration
  def change
		add_column :client_details, :account_id, :integer
  end
end
