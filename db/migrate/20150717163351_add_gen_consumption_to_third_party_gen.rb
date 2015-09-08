class AddGenConsumptionToThirdPartyGen < ActiveRecord::Migration
  def change
    add_column :third_party_gens, :genConsumption, :decimal, :precision => 10, :scale => 2 
  end
end
