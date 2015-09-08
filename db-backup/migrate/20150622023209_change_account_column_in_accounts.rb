class ChangeAccountColumnInAccounts < ActiveRecord::Migration
  def change
  change_column :Accounts, :number, :text
	end
end
