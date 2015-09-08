class RemovegenConsumptionFromgenDetails < ActiveRecord::Migration
  def change
   remove_column:gen_details, :genConsumption
  end
end
