class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_login, only: [:create, :destroy, :edit, :new, :update]

  # GET /regions
  def index
    @regions = Region.all
  end

  # GET /regions/1
  def show
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
    @last_update = @region.updated_at.localtime.to_fs(:date_twelve_hour)
  end

  # POST /regions
  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to @region, notice: 'Region was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /regions/1
  def update
    if @region.update(region_params)
      redirect_to @region, notice: 'Region was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /regions/1
  def destroy
    @region.destroy
    redirect_to regions_url, notice: 'Region was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:name, :key_term_id)
    end
end
