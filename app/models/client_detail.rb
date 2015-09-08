class ClientDetail < ActiveRecord::Base
  belongs_to :sender_detail
  has_many :quotation
  has_many :bank

  
  validates_presence_of :contactNo
  validates_format_of :contactNo, with: /[0-9]/
  validates_length_of :contactNo, :maximum =>12, :minimum => 4

  validates_presence_of :sender_details_id
#	validates_presence_of :bank_id
	validates_presence_of :account_id
end
