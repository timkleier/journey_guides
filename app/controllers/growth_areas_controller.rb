class GrowthAreasController < ApplicationController
  before_action :set_growth_area, only: [:show, :edit, :update, :destroy]

  # GET /growth_areas
  # GET /growth_areas.json
  def index
    @growth_areas = GrowthArea.all
  end

  # GET /growth_areas/1
  # GET /growth_areas/1.json
  def show
  end

  # GET /growth_areas/new
  def new
    @growth_area = GrowthArea.new
  end

  # GET /growth_areas/1/edit
  def edit
  end

  # POST /growth_areas
  # POST /growth_areas.json
  def create
    @growth_area = GrowthArea.new(growth_area_params)

    respond_to do |format|
      if @growth_area.save
        format.html { redirect_to @growth_area, notice: 'Growth area was successfully created.' }
        format.json { render :show, status: :created, location: @growth_area }
      else
        format.html { render :new }
        format.json { render json: @growth_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growth_areas/1
  # PATCH/PUT /growth_areas/1.json
  def update
    respond_to do |format|
      if @growth_area.update(growth_area_params)
        format.html { redirect_to @growth_area, notice: 'Growth area was successfully updated.' }
        format.json { render :show, status: :ok, location: @growth_area }
      else
        format.html { render :edit }
        format.json { render json: @growth_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growth_areas/1
  # DELETE /growth_areas/1.json
  def destroy
    @growth_area.destroy
    respond_to do |format|
      format.html { redirect_to growth_areas_url, notice: 'Growth area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_growth_area
      @growth_area = GrowthArea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def growth_area_params
      params.require(:growth_area).permit(:title)
    end
end
