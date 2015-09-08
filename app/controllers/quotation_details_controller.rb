class QuotationDetailsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def index 
    @quotations = QuotationDetail.all
  end

  def show	
    @quotation_detail = QuotationDetail.find(params[:id])
    @client_detail    = ClientDetail.find(@quotation_detail.client_details_id)
    @sender_detail    = SenderDetail.find(@quotation_detail.sender_details_id)
    @quotation_rent   = QuotationRent.where(quotation_detail_id: params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'Quotation',
        :template   => 'quotation_details/show.pdf.erb',
        :layout     => 'pdf.html.erb',
        :page_size  => 'A4',
        :dpi        => '300',
        outline: {  outline:           true,
                    outline_depth:     1 },
        margin:  {  top:               18,
                    bottom:            5,
                    left:              0,
                    right:             0},        
        :show_as_html => params[:debug].present?
      end       
    end
  end
  
  def new
	 @gen_avail = GenAvail.new	
  end
  
  def notice
  end

  def mail
    @quotation_detail = QuotationDetail.find(params[:id])
    @client_detail    = ClientDetail.find(@quotation_detail.client_details_id)
    @sender_detail    = SenderDetail.find(@quotation_detail.sender_details_id)
    @quotation_rent   = QuotationRent.where(quotation_detail_id: params[:id])

	  pdf = render_to_string :pdf          => 'Quotation', 
                           :template     => 'quotation_details/show.pdf.erb', 
                           :layout       => 'pdf.html.erb', :page_size => 'A4',
				
        :dpi        => '300',
        outline: {  outline:           true,
                    outline_depth:     1 },
        margin:  {  top:               18,
                    bottom:            5,
                    left:              0,
                    right:             0},        
                           :show_as_html => params[:debug].present?

   QtMailer.qt_email(@client_detail, @sender_detail, pdf).deliver
	 @quotation_detail.mailStatus = true
  	@date = DateTime.now.to_date
	@quotation_detail.dateOfMail = @date
	 @quotation_detail.save
	 redirect_to action: 'notice'	
  end

  def approve
		@quotation = QuotationDetail.where(client_details_id: params[:id])
		@quotation.each do|qot|
			@qid = qot.id
		end
	  @quotation_rent = QuotationRent.all
	  @aArray = Array.new
	 @gen_details = GenDetail.where("total_gen > 0")

		@aArray.push("Select")
	@gen_details.pluck(:id, :genType).each do|id, genType| 
		@aArray.push(genType)
	end
    @quotation_rent.each do|rent|
	 @taxesLabel = Array.new
	 @taxesPercentage = Array.new
	 @taxes = Tax.all
	 @taxes.each do|a|
		@taxesLabel.push(a.taxName)
		@taxesPercentage.push(a.taxPercentage)
	 end
    
  end
  end

  def contractClose
	@client_id = ClientDetail.find(params[:id])
	@client_id.contract = false	 
	@client_id.save
  end
  
  def contractOpen
	@client_id = ClientDetail.find(params[:id])
	@client_id.contract = true
	@client_id.save
  end

  def create	

  	@gens = ClientGenSet.new(gen_detail_params)	
        @gaurd = GaurdDetail.new(gaurd_detail_params)  
       @gaurd.save
	@gens.gaurd_detail_id = @gaurd.id
	@gens.quotation_detail_id = params[:client_gen_set][:qid]
#condition to check if other gen are nto availabel!!!!!	
	     success = false
if params[:client_gen_set][:gen_avail_id].blank?
	@third_party_gen = ThirdPartyGen.new
  	@third_party_gen.genRent = params[:third_party_gens][:genRent]
   	@third_party_gen.genConsumption = params[:third_party_gens][:genConsumption]
 	@third_party_gen.service_due_hours = params[:third_party_gens][:service_due_after]
@third_party_gen.third_party_provider_id = params[:client_gen_set][:third_party_provider_id] 
  	@third_party_gen.gen_detail_id = params[:client_gen_set][:gen_detail_id] 
    	@third_party_gen.save
	@gens.third_party_gen_id = @third_party_gen.id	
	@gens.serviceTax =  params[:client_gen_set][:serviceTax].to_d
	@gens.eduTax = 	params[:client_gen_set][:eduTax].to_d
  	@gens.genRent = params[:third_party_gens][:genRent]
	@client_id = params[:client_gen_set][:client_detail_id]
  	@approved = ClientDetail.find(@client_id)
  	@approved.approved = 'true'
  	@approved.save
	
	if @gens.save
	success = true
	end
else
    	@client_id = params[:client_gen_set][:client_detail_id]
  	@approved = ClientDetail.find(@client_id)
  	@approved.approved = 'true'
  	@approved.save
	@gens.serviceTax =  params[:client_gen_set][:serviceTax].to_d
	@gens.eduTax = 	params[:client_gen_set][:eduTax].to_d

	@gen_avail = GenAvail.find(params[:client_gen_set][:gen_avail_id])
	if @gens.save
	   @gen_avail.available = 'false'
	  if  @gen_avail.save
	     success = true
	  end
	end
end
  	if success
	   redirect_to gen_expenses_path
	else
	   render "index"
	end
  end
 
   def quote(quotation)
    quotation.subject            = params[:content][:quotation_subject][:value]
    quotation.date               = params[:content][:quotation_date][:value]
    quotation.regard             = params[:content][:quotation_regard][:value]    
    quotation.regardContent      = params[:content][:quotation_regardContent][:value]
    quotation.bankZoneOne        = params[:content][:quotation_bankZoneOne][:value]
    quotation.bankZoneTwo        = params[:content][:quotation_bankZoneTwo][:value]
    quotation.bankNameTwo        = params[:content][:quotation_bankNameTwo][:value]
    quotation.bankNameThree      = params[:content][:quotation_bankNameThree][:value]
    quotation.bankNameFour       = params[:content][:quotation_bankNameFour][:value]
    quotation.bankNameFive       = params[:content][:quotation_bankNameFive][:value]
    quotation.quotationLine      = params[:content][:quotation_quotationLine][:value]
    quotation.contentPartOne     = params[:content][:quotation_contentPartOne][:value] 
    quotation.contentPartTwo     = params[:content][:quotation_contentPartTwo][:value]
    quotation.thankYou           = params[:content][:quotation_thankYou][:value]
    quotation.yoursTruly         = params[:content][:quotation_yoursTruly][:value]
    quotation.nameOfCompany      = params[:content][:quotation_nameOfCompany][:value]
    quotation.emailIdOne         = params[:content][:quotation_emailIdOne][:value]
    quotation.emailIdTwo         = params[:content][:quotation_emailIdTwo][:value]
    quotation.emailIdThree       = params[:content][:quotation_emailIdThree][:value]
    quotation.emailIdFour        = params[:content][:quotation_emailIdFour][:value]
    quotation.contactNumberOne   = params[:content][:quotation_contactNumberOne][:value]
    quotation.contactNumberTwo   = params[:content][:quotation_contactNumberTwo][:value]
    quotation.contactNumberThree = params[:content][:quotation_contactNumberThree][:value]

    quotation.save!
  
    render text: ''
  end

  def update 

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
    @quote_detail = QuotationDetail.find(params[:id])

	 if @quote_detail.mailStatus == true	
		@quotation_detail = QuotationDetail.new()
		@quotation_detail.client_details_id = @quote_detail.client_details_id
		@quotation_detail.sender_details_id = @quote_detail.sender_details_id
		quote(@quotation_detail)
         	
		@qtn_rent = QuotationRent.new	
		@qtn_rent.genType = types
		@qtn_rent.genRent = rents
		@qtn_rent.client_detail_id = @quote_detail.client_details_id
		@qtn_rent.quotation_detail_id = @quote_detail.id
		@qtn_rent.save

	 elsif  @quote_detail.mailStatus == false
    @quotation_detail = QuotationDetail.find(params[:id])
		quote(@quotation_detail)
		@quotation_rent = QuotationRent.where(quotation_detail_id: params[:id])
		counter	= params[:content][:quotation_counter][:value].to_i
		gentype =''
		genrent =''
    
    counter.times do |i|
			c_type = "quotation_type" + (i + 1).to_s
			c_rent = "quotation_rent" + (i + 1).to_s
			gentype += params[:content][c_type][:value]
			gentype += ','
			genrent += params[:content][c_rent][:value]
			genrent += ','
		end

		@quotation_rent.each do |q_rent|
		  q_rent.genType = gentype
		  q_rent.genRent = genrent
		  q_rent.save
		end
		
    	end
  end	
  
  def updateClientGenSet
  
#  	@third_party_gen.genType = params[:client_gen_set][:gen_detail_id]
#	= params[:client_gen_set][:client_detail_id]
#	= params[:client_gen_set][:gen_avail_id]
#	= params[:client_gen_set][:third_party_provider_id]
#	= params[:third_party_gens][:genRent]
#	= params[:client_gen_set][:genRent]
#	= params[:client_gen_set][:serviceTax]
#	= params[:client_gen_set][:eduTax]
#	= params[:gaurd_detail][:name]	
#	= params[:gaurd_detail][:contactNo]
#	= params[:gaurd_detail][:monthlySalary]
 
 #   quotation.subject = params[:content][:quotation_subject][:value]
  end
  
  def notfound
  end
	
  def profitloss
  end

  private
    def gen_detail_params
      params.require(:client_gen_set).permit(:quotation_detail_id, :genRent, :genConsumption, :service_due_after, :gen_avail_id, :client_detail_id, :serviceTax, :eduTax, :approveDate, :approveMonth, :approveYear, :tds)
    end

    def gaurd_detail_params
      params.require(:gaurd_detail).permit(:name, :contactNo, :monthlySalary)
    end
end
