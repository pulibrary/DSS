class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_login, only: [:create, :destroy, :edit, :new, :update]

  # GET /countries
  def index
    @countries = Country.all
  end

  # GET /countries/1
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
    @last_update = @country.updated_at.localtime.to_fs(:date_twelve_hour)
  end

  # POST /countries
  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to @country, notice: 'Country was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /countries/1
  def update
    if @country.update(country_params)
      redirect_to @country, notice: 'Country was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
    redirect_to countries_url, notice: 'Country was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :key_term_id)
    end
end
