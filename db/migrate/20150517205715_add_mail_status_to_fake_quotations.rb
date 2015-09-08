class AddMailStatusToFakeQuotations < ActiveRecord::Migration
  def change
    add_column :fake_quotations, :mailStatus, :boolean
  end
end
