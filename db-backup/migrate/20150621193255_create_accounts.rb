class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :number
      t.string :ifsc
      t.string :micr

      t.timestamps null: false
    end
  end
end
