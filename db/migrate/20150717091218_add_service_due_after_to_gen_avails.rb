class AddServiceDueAfterToGenAvails < ActiveRecord::Migration
  def change
    add_column :gen_avails, :service_due_after, :int
  end
end
