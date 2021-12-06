class EncomendasController < ApplicationController
  # GET /encomendas or /encomendas.json
  def index
    @encomendas = Encomenda.all
  end

  # GET /encomendas/1 or /encomendas/1.json
  def show
    @encomenda = Encomenda.find(params[:id])
    @produtos = @encomenda.produtos
  end

  # GET /encomendas/new
  def new
    @encomenda = Encomenda.new
  end

  # GET /encomendas/1/edit
  def edit
    @encomenda = Encomenda.find(params[:id])
  end

  # POST /encomendas or /encomendas.json
  def create
    @funcionario = Funcionario.find(encomenda_params[:funcionario_id])
    @morador = Morador.find(encomenda_params[:morador_id])
    @encomenda = Encomenda.new(encomenda_params)
    @funcionario.encomendas << @encomenda
    @morador.encomendas << @encomenda
    
    respond_to do |format|
      if @encomenda.save
        format.html { redirect_to @encomenda, notice: "Encomenda was successfully created." }
        format.json { render :show, status: :created, location: @encomenda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @encomenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encomendas/1 or /encomendas/1.json
  def update
    @encomenda = Encomenda.find(params[:id])
    
    respond_to do |format|
      if @encomenda.update(encomenda_params)
        format.html { redirect_to @encomenda, notice: "Encomenda was successfully updated." }
        format.json { render :show, status: :ok, location: @encomenda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @encomenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encomendas/1 or /encomendas/1.json
  def destroy
    @encomenda = Encomenda.find(params[:id])
    @encomenda.destroy
    respond_to do |format|
      format.html { redirect_to encomendas_url, notice: "Encomenda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def encomenda_params
      params.require(:encomenda).permit(:remetente, :data, :funcionario_id, :morador_id)
    end
end
