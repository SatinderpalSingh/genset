class CreateGenDetails < ActiveRecord::Migration
  def change
    create_table :gen_details do |t|
      t.string :genType
      t.decimal :genRent, precision: 10, scale: 2  
      t.integer :totalGen, limit: 3

      t.timestamps null: false
    end
  end
end
