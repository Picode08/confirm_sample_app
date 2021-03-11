class EverychecksController < ApplicationController
  before_action :set_everycheck, only: %i[ show edit update destroy ]

  # GET /everychecks or /everychecks.json
  def index
    @everychecks = Everycheck.all
  end

  # GET /everychecks/1 or /everychecks/1.json
  def show
  end

  # GET /everychecks/new
  def new
    @everycheck = Everycheck.new
  end

  # GET /everychecks/1/edit
  def edit
  end

  # POST /everychecks or /everychecks.json
  def create
    @everycheck = Everycheck.new(everycheck_params)

    respond_to do |format|
      if @everycheck.save
        format.html { redirect_to @everycheck, notice: "Everycheck was successfully created." }
        format.json { render :show, status: :created, location: @everycheck }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @everycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /everychecks/1 or /everychecks/1.json
  def update
    respond_to do |format|
      if @everycheck.update(everycheck_params)
        format.html { redirect_to @everycheck, notice: "Everycheck was successfully updated." }
        format.json { render :show, status: :ok, location: @everycheck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @everycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /everychecks/1 or /everychecks/1.json
  def destroy
    @everycheck.destroy
    respond_to do |format|
      format.html { redirect_to everychecks_url, notice: "Everycheck was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_everycheck
      @everycheck = Everycheck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def everycheck_params
      params.require(:everycheck).permit(:foodname, :calorie, :eat_date, :eat_time)
    end
end
