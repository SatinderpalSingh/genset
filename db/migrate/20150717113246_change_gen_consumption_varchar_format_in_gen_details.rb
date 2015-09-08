class ChangeGenConsumptionVarcharFormatInGenDetails < ActiveRecord::Migration

  def up
#   change_column :gen_details, :genConsumption, 'decimal USING CAST(`genConsumption` AS decimal)', :precision => 10, :scale =>2
  end

  def down
   change_column :gen_details, :genConsumption, :varchar
  end

end
