class EstadiasController < ApplicationController
  before_action :set_estadia, only: [:show, :edit, :update, :destroy]

  # GET /estadias
  # GET /estadias.json
  def index
    @estadias = Estadia.all
  end

  # GET /estadias/1
  # GET /estadias/1.json
  def show
  end

  # GET /estadias/new
  def new
    @estadia = Estadia.new
  end

  # GET /estadias/1/edit
  def edit
  end

  # POST /estadias
  # POST /estadias.json
  def create
    @estadia = Estadia.new(estadia_params)

    respond_to do |format|
      if @estadia.save
        format.html { redirect_to @estadia, notice: 'Estadia was successfully created.' }
        format.json { render :show, status: :created, location: @estadia }
      else
        format.html { render :new }
        format.json { render json: @estadia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estadias/1
  # PATCH/PUT /estadias/1.json
  def update
    respond_to do |format|
      if @estadia.update(estadia_params)
        format.html { redirect_to @estadia, notice: 'Estadia was successfully updated.' }
        format.json { render :show, status: :ok, location: @estadia }
      else
        format.html { render :edit }
        format.json { render json: @estadia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estadias/1
  # DELETE /estadias/1.json
  def destroy
    @estadia.destroy
    respond_to do |format|
      format.html { redirect_to estadias_url, notice: 'Estadia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estadia
      @estadia = Estadia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estadia_params
      params.require(:estadia).permit(:dataCheckIn, :dataCheckOut, :cliente_id, :quarto_id, :hotel_id)
    end
end
