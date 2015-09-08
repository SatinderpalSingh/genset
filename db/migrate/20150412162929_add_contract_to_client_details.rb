class AddContractToClientDetails < ActiveRecord::Migration
  def change
    add_column :client_details, :contract, :boolean, :default => true
  end
end
