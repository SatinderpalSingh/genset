class CreateBillTables < ActiveRecord::Migration
  def change
    create_table :bill_tables do |t|
      t.integer :bill_id
      t.float :monthly_rent
      t.string :mail_sent
      t.float :third_party_payment
      t.float :owner_payment
      t.belongs_to :quotation, index: true
      t.timestamps null: false
    end
  end
end
