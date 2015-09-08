class AddColumnToClientDetails < ActiveRecord::Migration
  def change
    add_column :client_details, :name, :string
  end
end
