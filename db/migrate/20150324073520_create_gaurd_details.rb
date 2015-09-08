class CreateGaurdDetails < ActiveRecord::Migration
  def change
    create_table :gaurd_details do |t|
      t.string :name
      t.text :address
      t.integer :contactNo 

      t.timestamps null: false
    end
  end
end
