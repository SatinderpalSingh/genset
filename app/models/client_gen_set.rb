class ClientGenSet < ActiveRecord::Base
  belongs_to :quotation_detail
  belongs_to :client_detail
  belongs_to :gen_avail
  belongs_to :gaurd_detail
  belongs_to :third_party_gen
end
