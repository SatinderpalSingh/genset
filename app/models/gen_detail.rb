class GenDetail < ActiveRecord::Base
  
  validates_format_of :genRent, with: /[0-9]/, :message => "accepts Numbers only"
  validates_format_of :total_gen, with: /[0-9]/, :message => "accepts Numbers only"

  has_many :gen_avails	
  has_many :third_party_gens
end
