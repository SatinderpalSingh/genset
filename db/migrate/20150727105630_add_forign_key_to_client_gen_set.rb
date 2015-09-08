class AddForignKeyToClientGenSet < ActiveRecord::Migration
  def change
		add_foreign_key :client_gen_sets, :third_party_gens
  end
end
