class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :taxName, limit: 15
      t.decimal :taxPercentage, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
