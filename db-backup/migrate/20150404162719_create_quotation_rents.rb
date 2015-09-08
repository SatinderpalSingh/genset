class CreateQuotationRents < ActiveRecord::Migration
  def change
    create_table :quotation_rents do |t|
      t.references :client_detail, index: true
      t.references :quotation_detail, index: true
      t.string :genType, :default => '5.00, 7.50, 10.00, 12.50, 15.00, 20.00, 25.00, 31.05, 35.00, 40.00, 50.00, 62.50, 75.00'
      t.string :genRent, :default => '7250.00, 9500.00, 11000.00, 12500.00, 13000.00, 13500.00, 17000.00, 19500.00, 21500.00, 27000.00, 29500.00, 39500.00, 43500.00'

      t.timestamps null: false
    end
    add_foreign_key :quotation_rents, :client_details
    add_foreign_key :quotation_rents, :quotation_details
  end
end
