class RenameThirdPartyGensIdInClientGenSet < ActiveRecord::Migration
  def change
		rename_column :client_gen_sets, :third_party_gens_id, :third_party_gen_id
  end
end
