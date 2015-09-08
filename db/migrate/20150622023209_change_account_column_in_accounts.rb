class ChangeAccountColumnInAccounts < ActiveRecord::Migration
  def change
  change_column :accounts, :number, :text
	end
end
