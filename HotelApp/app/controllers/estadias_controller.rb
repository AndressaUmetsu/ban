class EstadiasController < ApplicationController
  before_action :set_estadias, only: [:show, :edit, :update, :destroy]

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
    @estadias = Estadia.new
  end

  # GET /estadias/1/edit
  def edit
  end

  # POST /estadias
  # POST /estadias.json
  def create
    @estadias = Estadia.new(estadias_params)

    respond_to do |format|
      if @estadias.save
        format.html { redirect_to @estadias, notice: 'Estadia was successfully created.' }
        format.json { render :show, status: :created, location: @estadias }
      else
        format.html { render :new }
        format.json { render json: @estadias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estadias/1
  # PATCH/PUT /estadias/1.json
  def update
    respond_to do |format|
      if @estadias.update(estadias_params)
        format.html { redirect_to @estadias, notice: 'Estadia was successfully updated.' }
        format.json { render :show, status: :ok, location: @estadias }
      else
        format.html { render :edit }
        format.json { render json: @estadias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estadias/1
  # DELETE /estadias/1.json
  def destroy
    @estadias.destroy
    respond_to do |format|
      format.html { redirect_to estadias_url, notice: 'Estadia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estadias
      @estadias = Estadia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estadias_params
      params.require(:estadias).permit(:dataCheckIn, :dataCheckOut, :cliente_id, :quarto_id, :hotel_id)
    end
end
