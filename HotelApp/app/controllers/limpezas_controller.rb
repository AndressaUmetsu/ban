class LimpezasController < ApplicationController
  before_action :set_limpeza, only: [:show, :edit, :update, :destroy]

  # GET /limpezas
  # GET /limpezas.json
  def index
    @limpezas = Limpeza.all
  end

  # GET /limpezas/1
  # GET /limpezas/1.json
  def show
  end

  # GET /limpezas/new
  def new
    @limpeza = Limpeza.new
  end

  # GET /limpezas/1/edit
  def edit
  end

  # POST /limpezas
  # POST /limpezas.json
  def create
    @limpeza = Limpeza.new(limpeza_params)

    respond_to do |format|
      if @limpeza.save
        format.html { redirect_to @limpeza, notice: 'Limpeza was successfully created.' }
        format.json { render :show, status: :created, location: @limpeza }
      else
        format.html { render :new }
        format.json { render json: @limpeza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /limpezas/1
  # PATCH/PUT /limpezas/1.json
  def update
    respond_to do |format|
      if @limpeza.update(limpeza_params)
        format.html { redirect_to @limpeza, notice: 'Limpeza was successfully updated.' }
        format.json { render :show, status: :ok, location: @limpeza }
      else
        format.html { render :edit }
        format.json { render json: @limpeza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /limpezas/1
  # DELETE /limpezas/1.json
  def destroy
    @limpeza.destroy
    respond_to do |format|
      format.html { redirect_to limpezas_url, notice: 'Limpeza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_limpeza
      @limpeza = Limpeza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def limpeza_params
      params.require(:limpeza).permit(:data, :hora)
    end
end
