class AddGenColumnToClientGenSet < ActiveRecord::Migration
  def change
    add_reference :client_gen_sets, :third_party_gens, index: true
    add_foreign_key :client_gen_sets, :third_party_gens
  end
end
