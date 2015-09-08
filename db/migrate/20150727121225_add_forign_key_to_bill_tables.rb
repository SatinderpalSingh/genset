class AddForignKeyToBillTables < ActiveRecord::Migration
  def change
		add_column :bill_tables, :third_party_provider_id, :integer
		add_foreign_key :bill_tables, :third_party_providers
  end
end
