class AddApproveMonthToClientGenSets < ActiveRecord::Migration
  def change
    add_column :client_gen_sets, :approveMonth, :varchar
  end
end
