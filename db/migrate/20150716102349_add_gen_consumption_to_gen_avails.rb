class AddGenConsumptionToGenAvails < ActiveRecord::Migration
  def change
    add_column :gen_avails, :genConsumption, :varchar
  end
end
