class ChangeNameofbankToBranchInClientDetail < ActiveRecord::Migration
  def change
    rename_column :client_details, :nameOfBank, :bank_branch
#		remove_foreign_key :client_details
  end
end
