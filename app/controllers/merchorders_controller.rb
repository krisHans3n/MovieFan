class MerchordersController < ApplicationController
  before_action :set_merchorder, only: [:show, :edit, :update, :destroy]

  # GET /merchorders
  # GET /merchorders.json
  def index
    @merchorders = Merchorder.all
  end

  # GET /merchorders/1
  # GET /merchorders/1.json
  def show
  end

  # GET /merchorders/new
  def new
    @merchorder = Merchorder.new
  end

  # GET /merchorders/1/edit
  def edit
  end

  # POST /merchorders
  # POST /merchorders.json
  def create
    @merchorder = Merchorder.new(merchorder_params)

    respond_to do |format|
      if @merchorder.save
        format.html { redirect_to @merchorder, notice: 'Merchorder was successfully created.' }
        format.json { render :show, status: :created, location: @merchorder }
      else
        format.html { render :new }
        format.json { render json: @merchorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchorders/1
  # PATCH/PUT /merchorders/1.json
  def update
    respond_to do |format|
      if @merchorder.update(merchorder_params)
        format.html { redirect_to @merchorder, notice: 'Merchorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchorder }
      else
        format.html { render :edit }
        format.json { render json: @merchorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchorders/1
  # DELETE /merchorders/1.json
  def destroy
    @merchorder.destroy
    respond_to do |format|
      format.html { redirect_to merchorders_url, notice: 'Merchorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchorder
      @merchorder = Merchorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchorder_params
      params.require(:merchorder).permit(:quantity, :merchandises_id, :orders_id)
    end
end
