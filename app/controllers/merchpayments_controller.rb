class MerchpaymentsController < ApplicationController
  before_action :set_merchpayment, only: [:show, :edit, :update, :destroy]

  # GET /merchpayments
  # GET /merchpayments.json
  def index
    @merchpayments = Merchpayment.all
  end

  # GET /merchpayments/1
  # GET /merchpayments/1.json
  def show
  end

  # GET /merchpayments/new
  def new
    @merchpayment = Merchpayment.new
  end

  # GET /merchpayments/1/edit
  def edit
  end

  # POST /merchpayments
  # POST /merchpayments.json
  def create
    @merchpayment = Merchpayment.new(merchpayment_params)

    respond_to do |format|
      if @merchpayment.save
        format.html { redirect_to @merchpayment, notice: 'Merchpayment was successfully created.' }
        format.json { render :show, status: :created, location: @merchpayment }
      else
        format.html { render :new }
        format.json { render json: @merchpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchpayments/1
  # PATCH/PUT /merchpayments/1.json
  def update
    respond_to do |format|
      if @merchpayment.update(merchpayment_params)
        format.html { redirect_to @merchpayment, notice: 'Merchpayment was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchpayment }
      else
        format.html { render :edit }
        format.json { render json: @merchpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchpayments/1
  # DELETE /merchpayments/1.json
  def destroy
    @merchpayment.destroy
    respond_to do |format|
      format.html { redirect_to merchpayments_url, notice: 'Merchpayment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchpayment
      @merchpayment = Merchpayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchpayment_params
      params.require(:merchpayment).permit(:users_id, :orders_id)
    end
end
