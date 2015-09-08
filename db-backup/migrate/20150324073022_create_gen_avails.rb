class CreateGenAvails < ActiveRecord::Migration
  def change
    create_table :gen_avails do |t|
      t.string :genID
      t.boolean :available, default: false
      t.references :gen_detail, index: true

      t.timestamps null: false
    end
    add_foreign_key :gen_avails, :gen_details
  end
end
