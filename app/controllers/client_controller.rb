class ClientController < ApplicationController
before_action :authenticate_user! 
def index
@client = ClientDetail.find(params[:id])
#@quotation_detail = QuotationDetail.where(client_detail_id: params[:id]]
end

end
