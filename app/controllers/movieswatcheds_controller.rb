class MovieswatchedsController < ApplicationController
  before_action :set_movieswatched, only: [:show, :edit, :update, :destroy]

  # GET /movieswatcheds
  # GET /movieswatcheds.json
  def index
    @movieswatcheds = Movieswatched.all
  end


  # GET /movieswatcheds/1
  # GET /movieswatcheds/1.json
  def show
  end

  # GET /movieswatcheds/new
  def new

    @movwatched = Movieswatched.new
    #movieswatched = @movwatched.create(movies_id: params[:seenit], users_id: "83")
    @movwatched.movies_id = params[:seenit]
    @movwatched.users_id = "3" #will switch with session id method
    @movwatched.save
    redirect_to movies_path

  end

  # GET /movieswatcheds/1/edit
  def edit
  end

  # POST /movieswatcheds
  # POST /movieswatcheds.json
  def create
    @movieswatched = Movieswatched.new(movieswatched_params)

    respond_to do |format|
      if @movieswatched.save
        format.html { redirect_to @movieswatched, notice: 'Movieswatched was successfully created.' }
        format.json { render :show, status: :created, location: @movieswatched }
      else
        format.html { render :new }
        format.json { render json: @movieswatched.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movieswatcheds/1
  # PATCH/PUT /movieswatcheds/1.json
  def update
    respond_to do |format|
      if @movieswatched.update(movieswatched_params)
        format.html { redirect_to @movieswatched, notice: 'Movieswatched was successfully updated.' }
        format.json { render :show, status: :ok, location: @movieswatched }
      else
        format.html { render :edit }
        format.json { render json: @movieswatched.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movieswatcheds/1
  # DELETE /movieswatcheds/1.json
  def destroy
    @movieswatched.destroy
    respond_to do |format|
      format.html { redirect_to movieswatcheds_url, notice: 'Movieswatched was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movieswatched
      @movieswatched = Movieswatched.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movieswatched_params
      params.require(:movieswatched).permit(:movies)
    end
end
