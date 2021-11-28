class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[ show edit update destroy ]

  # GET /produtos or /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1 or /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @encomenda = Encomenda.find_by(id: params[:encomenda_id])
    @produto = @encomenda.produtos.build
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos or /produtos.json
  def create
    @encomenda = Encomenda.find(params[:encomenda_id])
    @produto = @encomenda.produtos.create(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: "Produto was successfully created." }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1 or /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: "Produto was successfully updated." }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1 or /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: "Produto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @encomenda = Encomenda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produto_params
      params.require(:encomenda).permit(:nome)
    end
end
