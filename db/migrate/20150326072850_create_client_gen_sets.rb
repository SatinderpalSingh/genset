class CreateClientGenSets < ActiveRecord::Migration
  def change
    create_table :client_gen_sets do |t|
      t.decimal :genRent, precision: 10, scale: 2
      t.decimal :monthlyTax, precision: 10, scale: 2
      t.references :quotation_detail, index: true
      t.references :client_detail, index: true
      t.references :gen_avail, index: true
      t.references :gaurd_detail, index: true

      t.timestamps null: false
    end
    add_foreign_key :client_gen_sets, :quotation_details
    add_foreign_key :client_gen_sets, :client_details
    add_foreign_key :client_gen_sets, :gen_avails
    add_foreign_key :client_gen_sets, :gaurd_details
  end
end
