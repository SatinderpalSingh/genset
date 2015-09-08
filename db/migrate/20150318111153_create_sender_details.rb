class CreateSenderDetails < ActiveRecord::Migration
  def change
    create_table :sender_details do |t|
      t.string :name
      t.string :emailID
      t.text :address
      t.integer :contactNo
      t.attachment :signature

      t.timestamps null: false
    end
  end
end
