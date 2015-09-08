class AddServiceDueAfterToGenDetails < ActiveRecord::Migration
  def change
    add_column :gen_details, :service_due_after, :int
  end
end
