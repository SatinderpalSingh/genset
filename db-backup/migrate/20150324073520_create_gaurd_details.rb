class CreateGaurdDetails < ActiveRecord::Migration
  def change
    create_table :gaurd_details do |t|
      t.string :name
      t.text :address
      t.integer :contactNo, limit: 12

      t.timestamps null: false
    end
  end
end
