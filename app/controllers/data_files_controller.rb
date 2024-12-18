class DataFilesController < ApplicationController
  before_action :set_data_file, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_login, only: [:create, :destroy, :edit, :new, :update]

  # GET /data_files
  # GET /data_files.json
  def index
    @data_files = DataFile.all
  end

  # GET /data_files/1
  # GET /data_files/1.json
  def show
  end

  # GET /data_files/new
  def new
    @data_file = DataFile.new
  end

  # GET /data_files/1/edit
  def edit
  end

  # POST /data_files
  # POST /data_files.json
  def create
    @data_file = DataFile.new(data_file_params)

    respond_to do |format|
      if @data_file.save
        format.html { redirect_to @data_file, notice: 'Data file was successfully created.' }
        format.json { render :show, status: :created, location: @data_file }
      else
        format.html { render :new }
        format.json { render json: @data_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_files/1
  # PATCH/PUT /data_files/1.json
  def update
    respond_to do |format|
      if @data_file.update(data_file_params)
        format.html { redirect_to @data_file, notice: 'Data file was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_file }
      else
        format.html { render :edit }
        format.json { render json: @data_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_files/1
  # DELETE /data_files/1.json
  def destroy
    @data_file.destroy
    respond_to do |format|
      format.html { redirect_to data_files_url, notice: 'Data file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_file
      @data_file = DataFile.find(params[:id])
    end

    def data_file_params
      params.require(:data_file).permit(:legacy_id, :files, :size, :comp_size, :line_count, :line_length, :part, :file_type_a, :file_type_b, :flag_one, :flag_two, :file_type_a, :file_type_tech, :note, :study_num, :permission, :timestamp, :study_id)
    end
end
