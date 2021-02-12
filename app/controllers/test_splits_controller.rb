class TestSplitsController < ApplicationController
  before_action :set_test_split, only: %i[show edit update destroy]

  # GET /test_splits or /test_splits.json
  def index
    @test_splits = TestSplit.all
  end

  # GET /test_splits/1 or /test_splits/1.json
  def show; end

  # GET /test_splits/new
  def new
    @test_split = TestSplit.new
  end

  # GET /test_splits/1/edit
  def edit; end

  # POST /test_splits or /test_splits.json
  def create
    @test_split = TestSplit.new(test_split_params)

    respond_to do |format|
      if @test_split.save
        format.html { redirect_to @test_split, notice: 'Test split was successfully created.' }
        format.json { render :show, status: :created, location: @test_split }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_split.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_splits/1 or /test_splits/1.json
  def update
    respond_to do |format|
      if @test_split.update(test_split_params)
        format.html { redirect_to @test_split, notice: 'Test split was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_split }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_split.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_splits/1 or /test_splits/1.json
  def destroy
    @test_split.destroy
    respond_to do |format|
      format.html { redirect_to test_splits_url, notice: 'Test split was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_test_split
    @test_split = TestSplit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_split_params
    params.require(:test_split).permit(:sub_component_id, :name, :split_id)
  end
end
