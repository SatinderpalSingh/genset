class QuotationRent < ActiveRecord::Base
  belongs_to :client_detail
  belongs_to :quotation_detail
end
