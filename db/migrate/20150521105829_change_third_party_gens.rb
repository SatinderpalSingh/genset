class ChangeThirdPartyGens < ActiveRecord::Migration
  def change
    rename_column :third_party_gens, :genType, :gen_detail_id
    change_column :third_party_gens, :gen_detail_id, 'integer USING CAST(gen_detail_id AS integer)'
  end
end
