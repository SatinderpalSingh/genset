class CreateServiceHours < ActiveRecord::Migration
  def change
    create_table :service_hours do |t|
      t.integer :client_gen_set_id
      t.string :hours_left

      t.timestamps null: false
    end
  end
end
