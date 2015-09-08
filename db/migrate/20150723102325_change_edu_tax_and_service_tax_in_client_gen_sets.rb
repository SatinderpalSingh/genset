class ChangeEduTaxAndServiceTaxInClientGenSets < ActiveRecord::Migration
  def change
		change_column :client_gen_sets, :serviceTax, :decimal, precision: 10, scale: 2
		change_column :client_gen_sets, :eduTax, :decimal, precision: 10, scale: 2
  end
end
