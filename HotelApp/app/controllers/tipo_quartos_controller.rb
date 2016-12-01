class TipoQuartosController < ApplicationController
  before_action :set_tipo_quarto, only: [:show, :edit, :update, :destroy]

  # GET /tipo_quartos
  # GET /tipo_quartos.json
  def index
    @tipo_quartos = TipoQuarto.all
  end

  # GET /tipo_quartos/1
  # GET /tipo_quartos/1.json
  def show
  end

  # GET /tipo_quartos/new
  def new
    @tipo_quarto = TipoQuarto.new
  end

  # GET /tipo_quartos/1/edit
  def edit
  end

  # POST /tipo_quartos
  # POST /tipo_quartos.json
  def create
    @tipo_quarto = TipoQuarto.new(tipo_quarto_params)

    respond_to do |format|
      if @tipo_quarto.save
        format.html { redirect_to @tipo_quarto, notice: 'Tipo quarto was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_quarto }
      else
        format.html { render :new }
        format.json { render json: @tipo_quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_quartos/1
  # PATCH/PUT /tipo_quartos/1.json
  def update
    respond_to do |format|
      if @tipo_quarto.update(tipo_quarto_params)
        format.html { redirect_to @tipo_quarto, notice: 'Tipo quarto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_quarto }
      else
        format.html { render :edit }
        format.json { render json: @tipo_quarto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_quartos/1
  # DELETE /tipo_quartos/1.json
  def destroy
    @tipo_quarto.destroy
    respond_to do |format|
      format.html { redirect_to tipo_quartos_url, notice: 'Tipo quarto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_quarto
      @tipo_quarto = TipoQuarto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_quarto_params
      params.require(:tipo_quarto).permit(:nome, :preco)
    end
end
