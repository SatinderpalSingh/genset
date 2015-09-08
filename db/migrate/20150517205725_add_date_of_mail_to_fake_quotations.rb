class AddDateOfMailToFakeQuotations < ActiveRecord::Migration
  def change
    add_column :fake_quotations, :dateOfMail, :varchar
  end
end
