class AddApproveYearToClientGenSets < ActiveRecord::Migration
  def change
    add_column :client_gen_sets, :approveYear, :varchar
  end
end
