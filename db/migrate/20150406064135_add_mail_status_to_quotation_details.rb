class AddMailStatusToQuotationDetails < ActiveRecord::Migration
  def change
    add_column :quotation_details, :mailStatus, :boolean, :default => false
  end
end
