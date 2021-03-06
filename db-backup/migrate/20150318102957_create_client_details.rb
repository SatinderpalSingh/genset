class CreateClientDetails < ActiveRecord::Migration
  def change
    create_table :client_details do |t|
      t.string :designation
      t.string :nameOfBank
      t.text :address
      t.string :district
      t.integer :contactNo, limit: 12
      t.string :emailID
      t.boolean :approved, default: false
      t.references :sender_details, index: true

      t.timestamps null: false
    end
  end
end
