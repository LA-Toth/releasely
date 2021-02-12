class TestResultsController < ApplicationController
  before_action :set_test_result, only: %i[show edit update destroy]

  # GET /test_results or /test_results.json
  def index
    @test_results = TestResult.all
  end

  # GET /test_results/1 or /test_results/1.json
  def show; end

  # GET /test_results/new
  def new
    @test_result = TestResult.new
  end

  # GET /test_results/1/edit
  def edit; end

  # POST /test_results or /test_results.json
  def create
    @test_result = TestResult.new(test_result_params)

    respond_to do |format|
      if @test_result.save
        format.html { redirect_to @test_result, notice: 'Test result was successfully created.' }
        format.json { render :show, status: :created, location: @test_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_results/1 or /test_results/1.json
  def update
    respond_to do |format|
      if @test_result.update(test_result_params)
        format.html { redirect_to @test_result, notice: 'Test result was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_results/1 or /test_results/1.json
  def destroy
    @test_result.destroy
    respond_to do |format|
      format.html { redirect_to test_results_url, notice: 'Test result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_result
    @test_result = TestResult.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_result_params
    params.require(:test_result).permit(:ext_id, :tests_count, :tests_passed, :tests_failed, :tests_skipped, :release_id,
                                        :split_id, :config_id, :asssignee_id)
  end
end
