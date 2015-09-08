class AddColumnToClientGenSet < ActiveRecord::Migration
  def change
    add_column :client_gen_sets, :serviceTax, :decimal, precision: 2, scale: 2
    add_column :client_gen_sets, :eduTax, :decimal, precision: 2, scale: 2
  end
end
