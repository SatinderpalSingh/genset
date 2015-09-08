class GenExpense < ActiveRecord::Base
  belongs_to :client_detail
  
  validates_presence_of :readingBy
end
