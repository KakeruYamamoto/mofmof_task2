class RealtorsController < ApplicationController
  before_action :set_realtor, only: [:show, :edit, :update, :destroy]
  def index
    @realtors = Realtor.all
  end

  def show
  end

  def new
    @realtor = Realtor.new
    5.times { @realtor.nearest_stations.build }
  end

  def edit
  end

  def create
    @realtor = Realtor.new(realtor_params)
    respond_to do |format|
      if @realtor.save
        format.html { redirect_to @realtor, notice: 'Realtor was successfully created.' }
        format.json { render :show, status: :created, location: @realtor }
      else
        format.html { render :new }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @realtor.update(realtor_params)
        format.html { redirect_to @realtor, notice: 'Realtor was successfully updated.' }
        format.json { render :show, status: :ok, location: @realtor }
      else
        format.html { render :edit }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @realtor.destroy
    respond_to do |format|
      format.html { redirect_to realtors_url, notice: 'Realtor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_realtor
      @realtor = Realtor.find(params[:id])
    end

    def realtor_params
      prms = params.require(:realtor).permit(:house, :price, :address, :age, :remarkes,
                                      nearest_stations_attributes: [ :id,:route_name, :station_name, :walking_minutes, :_destroy])
    end
end
