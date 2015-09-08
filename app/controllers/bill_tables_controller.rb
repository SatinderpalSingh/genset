class BillTablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bill_table, only: [:show, :edit, :update, :destroy]

  # GET /bill_tables
  # GET /bill_tables.json
  def index
    @bill_tables = BillTable.all
  end

  # GET /bill_tables/1
  # GET /bill_tables/1.json
  def show
  end

  # GET /bill_tables/new
  def new
    @bill_table = BillTable.new
  end

  # GET /bill_tables/1/edit
  def edit
  end

  # POST /bill_tables
  # POST /bill_tables.json
  def create
    @bill_table = BillTable.new(bill_table_params)

    respond_to do |format|
      if @bill_table.save
        format.html { redirect_to @bill_table, notice: 'Bill table was successfully created.' }
        format.json { render :show, status: :created, location: @bill_table }
      else
        format.html { render :new }
        format.json { render json: @bill_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_tables/1
  # PATCH/PUT /bill_tables/1.json
  def update
    respond_to do |format|
      if @bill_table.update(bill_table_params)
        format.html { redirect_to @bill_table, notice: 'Bill table was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_table }
      else
        format.html { render :edit }
        format.json { render json: @bill_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_tables/1
  # DELETE /bill_tables/1.json
  def destroy
    @bill_table.destroy
    respond_to do |format|
      format.html { redirect_to bill_tables_url, notice: 'Bill table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_table
      @bill_table = BillTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_table_params
      params.require(:bill_table).permit(:bill_id, :monthly_rent, :mail_sent, :third_party_payment, :owner_payment)
    end
end
