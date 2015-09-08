class CreateThirdPartyGens < ActiveRecord::Migration
  def change
    create_table :third_party_gens do |t|
      t.string :genID
      t.decimal :genRent, precision: 10, scale: 2 
      t.string :genType
      t.references :third_party_provider, index: true

      t.timestamps null: false
    end
    add_foreign_key :third_party_gens, :third_party_providers
  end
end
