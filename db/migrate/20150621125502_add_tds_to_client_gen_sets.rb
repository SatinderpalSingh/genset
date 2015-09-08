class AddTdsToClientGenSets < ActiveRecord::Migration
  def change
    add_column :client_gen_sets, :tds, :decimal
  end
end
