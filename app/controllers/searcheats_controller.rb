class SearcheatsController < ApplicationController
 
  before_action :set_searcheat, only: [:show, :edit, :update, :destroy]
 # before_action :authenticate_user! ,only: [:show, :edit, :update, :destroy]
  # GET /searcheats
  # GET /searcheats.json
   def home 
        @searcheatskind =Searcheat.select(:kind).distinct
        if  params[:search]
            @searcheats = Searcheat.where('kind LIKE ?', "%#{params[:search]}%" )
        else
            @searcheats = Searcheat.all
        end
  def index
      
     @searcheats = Searcheat.all
  end
  
        # if params[:search2]
        #     @searcheats = Searcheat.where('location LIKE ?', "%#{params[:search2]}%")
        # else
        #   @searcheats = Searcheat.all 
        # end

  end
  # GET /searcheats/1
  # GET /searcheats/1.json
  def show
  end

  # GET /searcheats/new
  def new
    @searcheat = Searcheat.new
  end

  # GET /searcheats/1/edit
  def edit
  end

  # POST /searcheats
  # POST /searcheats.json
  def create
    @searcheat = Searcheat.new(searcheat_params)

    respond_to do |format|
      if @searcheat.save
        format.html { redirect_to @searcheat, notice: 'Searcheat was successfully created.' }
        format.json { render :show, status: :created, location: @searcheat }
      else
        format.html { render :new }
        format.json { render json: @searcheat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searcheats/1
  # PATCH/PUT /searcheats/1.json
  def update
    respond_to do |format|
      if @searcheat.update(searcheat_params)
        format.html { redirect_to @searcheat, notice: 'Searcheat was successfully updated.' }
        format.json { render :show, status: :ok, location: @searcheat }
      else
        format.html { render :edit }
        format.json { render json: @searcheat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searcheats/1
  # DELETE /searcheats/1.json
  def destroy
    @searcheat.destroy
    respond_to do |format|
      format.html { redirect_to searcheats_url, notice: 'Searcheat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_searcheat
      @searcheat = Searcheat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def searcheat_params
      params.require(:searcheat).permit(:name, :price, :location, :people, :kind)
    end
end
