class AddDateOfMailToQuotationDetails < ActiveRecord::Migration
  def change
    add_column :quotation_details, :dateOfMail, :varchar
  end
end
