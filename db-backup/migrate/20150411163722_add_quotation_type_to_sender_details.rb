class AddQuotationTypeToSenderDetails < ActiveRecord::Migration
  def change
    add_column :sender_details, :quotationType, :string
  end
end
