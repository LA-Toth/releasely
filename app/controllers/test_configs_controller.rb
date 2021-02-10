class TestConfigsController < ApplicationController
  before_action :set_test_config, only: %i[show edit update destroy]

  # GET /test_configs or /test_configs.json
  def index
    @test_configs = TestConfig.all
  end

  # GET /test_configs/1 or /test_configs/1.json
  def show; end

  # GET /test_configs/new
  def new
    @test_config = TestConfig.new
  end

  # GET /test_configs/1/edit
  def edit; end

  # POST /test_configs or /test_configs.json
  def create
    @test_config = TestConfig.new(test_config_params)

    respond_to do |format|
      if @test_config.save
        format.html { redirect_to @test_config, notice: 'Test config was successfully created.' }
        format.json { render :show, status: :created, location: @test_config }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_configs/1 or /test_configs/1.json
  def update
    respond_to do |format|
      if @test_config.update(test_config_params)
        format.html { redirect_to @test_config, notice: 'Test config was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_config }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_configs/1 or /test_configs/1.json
  def destroy
    @test_config.destroy
    respond_to do |format|
      format.html { redirect_to test_configs_url, notice: 'Test config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_config
    @test_config = TestConfig.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_config_params
    params.require(:test_config).permit(:name, :short_name)
  end
end
