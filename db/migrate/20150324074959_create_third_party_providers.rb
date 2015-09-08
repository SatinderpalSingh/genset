class CreateThirdPartyProviders < ActiveRecord::Migration
  def change
    create_table :third_party_providers do |t|
      t.string :name
      t.text :address
      t.integer :contactNo

      t.timestamps null: false
    end
  end
end
