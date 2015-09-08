class AddMailStatusToClientDetails < ActiveRecord::Migration
  def change
    add_column :client_details, :mailStatus, :boolean, :default => false
  end
end
