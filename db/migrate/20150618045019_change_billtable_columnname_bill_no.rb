class ChangeBilltableColumnnameBillNo < ActiveRecord::Migration
   def up
    change_column :bill_tables, :bill_no, :string
  end

  def down
    change_column :bill_tables, :bill_no, :integer
  end
end
