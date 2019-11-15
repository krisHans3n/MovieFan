class SubplansController < ApplicationController
  before_action :set_subplan, only: [:show, :edit, :update, :destroy]

  # GET /subplans
  # GET /subplans.json
  def index
    @subplans = Subplan.all
  end

  # GET /subplans/1
  # GET /subplans/1.json
  def show
  end

  # GET /subplans/new
  def new
    @subplan = Subplan.new
  end

  # GET /subplans/1/edit
  def edit
  end

  # POST /subplans
  # POST /subplans.json
  def create
    @subplan = Subplan.new(subplan_params)

    respond_to do |format|
      if @subplan.save
        format.html { redirect_to @subplan, notice: 'Subplan was successfully created.' }
        format.json { render :show, status: :created, location: @subplan }
      else
        format.html { render :new }
        format.json { render json: @subplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subplans/1
  # PATCH/PUT /subplans/1.json
  def update
    respond_to do |format|
      if @subplan.update(subplan_params)
        format.html { redirect_to @subplan, notice: 'Subplan was successfully updated.' }
        format.json { render :show, status: :ok, location: @subplan }
      else
        format.html { render :edit }
        format.json { render json: @subplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subplans/1
  # DELETE /subplans/1.json
  def destroy
    @subplan.destroy
    respond_to do |format|
      format.html { redirect_to subplans_url, notice: 'Subplan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subplan
      @subplan = Subplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subplan_params
      params.require(:subplan).permit(:plantype, :recurring)
    end
end
