class ClientDetailsController < ApplicationController
  before_action :authenticate_user!

  def index
    @client_details = ClientDetail.all
    @sender_details = SenderDetail.all
    @quotations     = QuotationDetail.all
    @fakeQuotations = FakeQuotation.all
  end

  def show
    @quotation_detail = QuotationDetail.find(params[:id])
    @client_detail = ClientDetail.find(@quotation_detail.client_details_id)
    @sender_detail = SenderDetail.find(@quotation_detail.sender_details_id)

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'Quotation',
        :template => 'client_details/mail.pdf.erb',
        :layout => 'pdf.html.erb',       
        :page_size => 'A4',
        :show_as_html => params[:debug].present?
      end       
    end

  end

  def new
    @client_detail = ClientDetail.new
  end

  def notice
  end

  def mail
  end

  def edit
    @client_detail = ClientDetail.find(params[:id])
  end

  def create
    @client_detail = ClientDetail.new(client_detail_params)
	  @gen = GenDetail.all
    @types = Array.new	
	  @rents = Array.new

    @gen.each do|gen|
		  type = gen.genType
  		rent = gen.genRent
	  	@types.push(type)
  		@rents.push(rent)
    end

    types = @types.join(",")
  	rents = @rents.join(",")

    if @client_detail.save

      @sender_detail = SenderDetail.find(@client_detail.sender_details_id)

      if (@sender_detail.quotationType == "Real")

        @quotation_detail = QuotationDetail.new()
        @quotation_detail.sender_details_id = @client_detail.sender_details_id
        @quotation_detail.client_details_id = @client_detail.id
        @quotation_detail.save

        @qtn_rent = QuotationRent.new()
  		  @qtn_rent.genType = types
        @qtn_rent.genRent = rents
        @qtn_rent.client_detail_id = @client_detail.id
        @qtn_rent.quotation_detail_id = @quotation_detail.id
        @qtn_rent.save      
        
        redirect_to quotation_detail_path(@quotation_detail.id)
      
      else
        
        @fake_quotation = FakeQuotation.new()
        @fake_quotation.sender_details_id = @client_detail.sender_details_id
        @fake_quotation.client_details_id = @client_detail.id
        @fake_quotation.save
        
        redirect_to fake_quotation_path(@fake_quotation.id)
      end
	
    else
      render "new"
    end
  end
  
  def quotations	
    @client_details = ClientDetail.find(params[:id])
    @quotations = QuotationDetail.where(client_details_id: params[:id])
  end

	def active_generators
		@active_generators = ClientGenSet.all
		@client_details = ClientDetail.all
	  @diesel_reading = DieselReading.new
		@service_hours = ServiceHour.new
	end

  def clientUpdate
    @client_detail = ClientDetail.find(params[:id])
    if @client_detail.mailStatus == true	
		  if @client_detail.save
			 @quotation_detail = QuotationDetail.new()
			 @quotation_detail.sender_details_id = @client_detail.sender_details_id
			 @quotation_detail.client_details_id = @client_detail.id
			 @quotation_detail.save
	   end
    elsif @client_detail.mailStatus == false
    	if @client_detail.update(client_detail_params)
      	redirect_to action: 'index'
    	else
      	render 'edit'
    	end    
  	end
  end

  def update

    @quotation_detail = QuotationDetail.where(client_details_id: params[:id])
    @quotation_detail.each do |quotation|
    quotation.subject = params[:content][:quotation_subject][:value]
    quotation.regard = params[:content][:quotation_regard][:value]    
    quotation.subject = params[:content][:quotation_subject][:value]
    quotation.regard = params[:content][:quotation_regard][:value]    
    quotation.regard = params[:content][:quotation_regard][:value]    
    quotation.regardContent = params[:content][:quotation_regardContent][:value]
    quotation.bankZoneOne = params[:content][:quotation_bankZoneOne][:value]
    quotation.bankZoneTwo = params[:content][:quotation_bankZoneTwo][:value]
    quotation.bankNameOne = params[:content][:quotation_bankNameOne][:value]
    quotation.bankNameTwo = params[:content][:quotation_bankNameTwo][:value]
    quotation.bankNameThree = params[:content][:quotation_bankNameThree][:value]
    quotation.bankNameFour = params[:content][:quotation_bankNameFour][:value]
    quotation.bankNameFive = params[:content][:quotation_bankNameFive][:value]
    quotation.quotationLine  = params[:content][:quotation_quotationLine][:value]
    quotation.quotationRateList = params[:content][:quotation_quotationRateList][:value] 
    quotation.contentPartOne = params[:content][:quotation_contentPartOne][:value] 
    quotation.contentPartTwo = params[:content][:quotation_contentPartTwo][:value]
    quotation.thankYou = params[:content][:quotation_thankYou][:value]
    quotation.yoursTruly = params[:content][:quotation_yoursTruly][:value]
    quotation.nameOfCompany = params[:content][:quotation_nameOfCompany][:value]
    quotation.emailIdOne = params[:content][:quotation_emailIdOne][:value]
    quotation.emailIdTwo = params[:content][:quotation_emailIdTwo][:value]
    quotation.emailIdThree = params[:content][:quotation_emailIdThree][:value]
    quotation.emailIdFour = params[:content][:quotation_emailIdFour][:value]
    quotation.contactNumberOne = params[:content][:quotation_contactNumberOne][:value]
    quotation.contactNumberTwo = params[:content][:quotation_contactNumberTwo][:value]
    quotation.contactNumberThree = params[:content][:quotation_contactNumberThree][:value]

    quotation.save!

    end

    render text: ''
  end

  private

  def client_detail_params
    params.require(:client_detail).permit(:designation, :name, :bank_branch, :address, :district, :contactNo, :emailID, :sender_details_id, :approved, :bank_id, :account_id)

  end
end
