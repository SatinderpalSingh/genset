class ChangeGenConsumptionVarcharFormatInGenAvails < ActiveRecord::Migration
  def up
#  change_column :gen_avails, :genConsumption, :decimal, :precision => 10, :scale => 2
  end  
  def down
  change_column :gen_avails, :genConsumption, :varchar
  end

end
