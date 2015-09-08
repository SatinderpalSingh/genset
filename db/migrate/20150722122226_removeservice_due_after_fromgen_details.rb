class RemoveserviceDueAfterFromgenDetails < ActiveRecord::Migration
  def change
    remove_column :gen_details, :service_due_after
  end
end
