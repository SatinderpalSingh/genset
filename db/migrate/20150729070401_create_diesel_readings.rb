class CreateDieselReadings < ActiveRecord::Migration
  def change
    create_table :diesel_readings do |t|
			t.integer :remaining_fuel
			t.integer :added_fuel
      t.integer :client_gen_set_id

      t.timestamps null: false
    end
    add_foreign_key :diesel_readings, :client_gen_sets
  end
end
