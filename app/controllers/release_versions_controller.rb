class ReleaseVersionsController < ApplicationController
  before_action :set_release_version, only: %i[show edit update destroy]

  # GET /release_versions or /release_versions.json
  def index
    @release_versions = ReleaseVersion.all
  end

  # GET /release_versions/1 or /release_versions/1.json
  def show; end

  # GET /release_versions/new
  def new
    @release_version = ReleaseVersion.new
  end

  # GET /release_versions/1/edit
  def edit; end

  # POST /release_versions or /release_versions.json
  def create
    @release_version = ReleaseVersion.new(release_version_params)

    respond_to do |format|
      if @release_version.save
        format.html { redirect_to @release_version, notice: 'Release version was successfully created.' }
        format.json { render :show, status: :created, location: @release_version }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @release_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /release_versions/1 or /release_versions/1.json
  def update
    respond_to do |format|
      if @release_version.update(release_version_params)
        format.html { redirect_to @release_version, notice: 'Release version was successfully updated.' }
        format.json { render :show, status: :ok, location: @release_version }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @release_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /release_versions/1 or /release_versions/1.json
  def destroy
    @release_version.destroy
    respond_to do |format|
      format.html { redirect_to release_versions_url, notice: 'Release version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_release_version
    @release_version = ReleaseVersion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def release_version_params
    params.require(:release_version).permit(:version)
  end
end
