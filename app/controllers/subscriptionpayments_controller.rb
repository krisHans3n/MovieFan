class SubscriptionpaymentsController < ApplicationController
  before_action :set_subscriptionpayment, only: [:show, :edit, :update, :destroy]

  # GET /subscriptionpayments
  # GET /subscriptionpayments.json
  def index
    @subscriptionpayments = Subscriptionpayment.all
  end

  # GET /subscriptionpayments/1
  # GET /subscriptionpayments/1.json
  def show
  end

  # GET /subscriptionpayments/new
  def new
    @subscriptionpayment = Subscriptionpayment.new
  end

  # GET /subscriptionpayments/1/edit
  def edit
  end

  # POST /subscriptionpayments
  # POST /subscriptionpayments.json
  def create
    @subscriptionpayment = Subscriptionpayment.new(subscriptionpayment_params)

    respond_to do |format|
      if @subscriptionpayment.save
        format.html { redirect_to @subscriptionpayment, notice: 'Subscriptionpayment was successfully created.' }
        format.json { render :show, status: :created, location: @subscriptionpayment }
      else
        format.html { render :new }
        format.json { render json: @subscriptionpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptionpayments/1
  # PATCH/PUT /subscriptionpayments/1.json
  def update
    respond_to do |format|
      if @subscriptionpayment.update(subscriptionpayment_params)
        format.html { redirect_to @subscriptionpayment, notice: 'Subscriptionpayment was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriptionpayment }
      else
        format.html { render :edit }
        format.json { render json: @subscriptionpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptionpayments/1
  # DELETE /subscriptionpayments/1.json
  def destroy
    @subscriptionpayment.destroy
    respond_to do |format|
      format.html { redirect_to subscriptionpayments_url, notice: 'Subscriptionpayment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriptionpayment
      @subscriptionpayment = Subscriptionpayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriptionpayment_params
      params.require(:subscriptionpayment).permit(:users_id, :subplans_id)
    end
end
