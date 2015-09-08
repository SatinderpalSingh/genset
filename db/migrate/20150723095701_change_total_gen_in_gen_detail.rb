class ChangeTotalGenInGenDetail < ActiveRecord::Migration
  def change
		rename_column :gen_details, :totalGen, :total_gen
  end
end
