class AddGenDetailToThirdPartyGen < ActiveRecord::Migration
  def change
    add_reference :third_party_gens, :GenDetail, index: true
#    add_foreign_key :third_party_gens, :GenDetails
  end
end
