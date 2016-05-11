class NightsController < ApplicationController
  before_action :set_night, only: [:show, :edit, :update, :destroy]

  def up_count
    @night = Night.find(params[:id])
    @night.count_up.save
    redirect_to @night
  end

  def down_count
    @night = Night.find(params[:id])
    @night.count_down.save
    redirect_to @night
  end

  def update_status
    p params
    @night = Night.find(1)
    @night.status = params[:night][:status]
    @night.save
    redirect_to @night
  end

  # GET /nights
  # GET /nights.json
  def index
    @nights = Night.all
  end

  # GET /nights/1
  # GET /nights/1.json
  def show
    if request.xhr?
      render '_count', layout: false, locals: { night: @night }
    end
  end

  # GET /nights/new
  def new
    @night = Night.new
  end

  # GET /nights/1/edit
  def edit
  end

  # POST /nights
  # POST /nights.json
  def create
    @night = Night.new(night_params)

    respond_to do |format|
      if @night.save
        format.html { redirect_to @night, notice: 'Night was successfully created.' }
        format.json { render :show, status: :created, location: @night }
      else
        format.html { render :new }
        format.json { render json: @night.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nights/1
  # PATCH/PUT /nights/1.json
  def update
    respond_to do |format|
      if @night.update(night_params)
        format.html { redirect_to @night, notice: 'Night was successfully updated.' }
        format.json { render :show, status: :ok, location: @night }
      else
        format.html { render :edit }
        format.json { render json: @night.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nights/1
  # DELETE /nights/1.json
  def destroy
    @night.destroy
    respond_to do |format|
      format.html { redirect_to nights_url, notice: 'Night was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_night
      @night = Night.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def night_params
      params.require(:night).permit(:count, :status)
    end
end
