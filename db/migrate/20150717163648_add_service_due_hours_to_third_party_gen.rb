class AddServiceDueHoursToThirdPartyGen < ActiveRecord::Migration
  def change
    add_column :third_party_gens, :service_due_hours, :integer
  end
end
