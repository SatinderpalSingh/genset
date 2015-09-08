class GenAvailsController < ApplicationController
  before_action :set_gen_avail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  # GET /gen_avails
  # GET /gen_avails.json
  def index
    @gen_avails = GenAvail.all
  end

  # GET /gen_avails/1
  # GET /gen_avails/1.json
  def show
  end

  # GET /gen_avails/new
  def new
    @gen_avail = GenAvail.new
  end

  # GET /gen_avails/1/edit
  def edit
	@gen = GenAvail.find(params[:id])
	@detail = GenDetail.find(@gen.gen_detail_id)
  end

  # POST /gen_avails
  # POST /gen_avails.json
  def create
    @gen_avail = GenAvail.new(gen_avail_params)
	@gen_avail.genConsumption = @gen_avail.genConsumption.to_d.round(2)
    gen_detail_id = gen_avail_params[:gen_detail_id]
    respond_to do |format|
      if @gen_avail.save
    	gens = GenAvail.where(gen_detail_id: gen_avail_params[:gen_detail_id]).count.to_i
    @gen_detail = GenDetail.find(gen_avail_params[:gen_detail_id])
	@gen_detail.total_gen = gens
	@gen_detail.save
        format.html { redirect_to gen_details_path }
#        format.html { redirect_to @gen_avail, notice: 'Gen avail was successfully created.' }
#        format.json { render :index, status: :created, location: gen_detail_path }
      else
        format.html { render :new }
        format.json { render json: @gen_avail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gen_avails/1
  # PATCH/PUT /gen_avails/1.json
  def update
    respond_to do |format|
      if @gen_avail.update(gen_avail_params)
        format.html { redirect_to controller: "gen_details", action: "index", notice: "Generator was updated successfully." }
#        format.html { redirect_to @gen_avail, notice: 'Gen avail was successfully updated.' }
#        format.json { render :show, status: :ok, location: @gen_avail }
      else
        format.html { render :edit }
        format.json { render json: @gen_avail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_avails/1
  # DELETE /gen_avails/1.json
  def destroy
   if @gen_avail.available
    @gen_avail.destroy
   end
    respond_to do |format|
        format.html { redirect_to controller: "gen_details", action: "index", notice: 'Generator was removed successfully.' }
#      format.html { redirect_to gen_details_url, notice: '' }
#      format.html { redirect_to gen_avails_url, notice: 'Gen avail was successfully destroyed.' }
#      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gen_avail
      @gen_avail = GenAvail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gen_avail_params
	
    params.require(:gen_avail).permit(:gen_detail_id, :genID, :available, :service_due_after, :genConsumption)
    end
end
