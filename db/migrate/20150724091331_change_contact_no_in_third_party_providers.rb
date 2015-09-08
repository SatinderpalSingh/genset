class ChangeContactNoInThirdPartyProviders < ActiveRecord::Migration
  def change
		change_column :third_party_providers, :contactNo, :bigint
  end
end
