class SubComponentsController < ApplicationController
  before_action :set_sub_component, only: %i[show edit update destroy]

  # GET /sub_components or /sub_components.json
  def index
    @sub_components = SubComponent.all
  end

  # GET /sub_components/1 or /sub_components/1.json
  def show; end

  # GET /sub_components/new
  def new
    @sub_component = SubComponent.new
  end

  # GET /sub_components/1/edit
  def edit; end

  # POST /sub_components or /sub_components.json
  def create
    @sub_component = SubComponent.new(sub_component_params)

    respond_to do |format|
      if @sub_component.save
        format.html { redirect_to @sub_component, notice: 'Sub component was successfully created.' }
        format.json { render :show, status: :created, location: @sub_component }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sub_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_components/1 or /sub_components/1.json
  def update
    respond_to do |format|
      if @sub_component.update(sub_component_params)
        format.html { redirect_to @sub_component, notice: 'Sub component was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_component }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sub_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_components/1 or /sub_components/1.json
  def destroy
    @sub_component.destroy
    respond_to do |format|
      format.html { redirect_to sub_components_url, notice: 'Sub component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sub_component
    @sub_component = SubComponent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sub_component_params
    params.require(:sub_component).permit(:name, :component_id)
  end
end
