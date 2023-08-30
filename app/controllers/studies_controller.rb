class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:show, :number_lookup]
  # GET /studies
  # GET /studies.json
  def index
    @studies = Study.all
  end

  # GET /studies/1
  # GET /studies/1.json
  def show
    @user = current_or_guest_user
    if @user.guest
      flash[:alert] = 'Data Files are for Use only By Princeton, Faculty, Students, and Staff'
    end
  end

  # GET/studynum/1234
  def number_lookup
    @study = Study.where('studynum = :studynum',  studynum: params[:studynum].to_i).take
    if @study
      redirect_to study_path(@study)
    else
      render status: :not_found
    end
  end

  # GET /studies/new
  def new
    @study = Study.new
  end

  # GET /studies/1/edit
  def edit
  end

  # POST /studies
  # POST /studies.json
  def create
    @study = Study.new(study_params)

    respond_to do |format|
      if @study.save
        format.html { redirect_to @study, notice: 'Study was successfully created.' }
        format.json { render :show, status: :created, location: @study }
      else
        format.html { render :new }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studies/1
  # PATCH/PUT /studies/1.json
  def update
    respond_to do |format|
      if @study.update(study_params)
        format.html { redirect_to @study, notice: 'Study was successfully updated.' }
        format.json { render :show, status: :ok, location: @study }
      else
        format.html { render :edit }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studies/1
  # DELETE /studies/1.json
  def destroy
    @study.destroy
    respond_to do |format|
      format.html { redirect_to studies_url, notice: 'Study was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the allow list through.
    def study_params
      params.require(:study).permit(:legacy_id, :studynum, :title, :medium, :icpsr_num, :url, :directory, :folder, :r_flag, :timestamp, :auto_refresh, :note, :roper, :voyager_id, :resource_id, country_ids: [], subject_ids: [], region_ids: [], data_files_attributes: [:id, :files, :file_type_a, :file_type_b, :flag_one, :flag_two, :file_type_tech, :part, :studynum, :note])
    end
end
