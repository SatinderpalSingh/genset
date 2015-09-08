class AddApproveDateToClientGenSets < ActiveRecord::Migration
  def change
    add_column :client_gen_sets, :approveDate, :varchar
  end
end
