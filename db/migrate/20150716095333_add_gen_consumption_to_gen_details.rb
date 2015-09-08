class AddGenConsumptionToGenDetails < ActiveRecord::Migration
  def change
    add_column :gen_details, :genConsumption, :varchar
  end
end
