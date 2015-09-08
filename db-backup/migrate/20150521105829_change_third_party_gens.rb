class ChangeThirdPartyGens < ActiveRecord::Migration
  def change
    rename_column :third_party_gens, :genType, :gen_detail_id
    change_column :third_party_gens, :gen_detail_id, :integer
  end
end
