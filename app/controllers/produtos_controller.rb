class ProdutosController < ApplicationController
  # GET /produtos or /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1 or /produtos/1.json
  def show
    @encomenda = Encomenda.find(params[:encomenda_id])
    @produto = @encomenda.produtos.find(params[:id])
  end

  # GET /produtos/new
  def new
    @encomenda = Encomenda.find(params[:encomenda_id])
    @produto = @encomenda.produtos.build
  end

  # GET /produtos/1/edit
  def edit
    @encomenda = Encomenda.find(params[:encomenda_id])
    @produto = @encomenda.produtos.find(params[:id])
  end

  # POST /produtos or /produtos.json
  def create
    @encomenda = Encomenda.find(params[:encomenda_id])
    @produto = @encomenda.produtos.create(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to encomenda_path(@encomenda), notice: "Produto was successfully created." }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1 or /produtos/1.json
  def update
    @encomenda = Encomenda.find(params[:encomenda_id])
    @produto = @encomenda.produtos.find(params[:id])

    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to encomenda_path(@encomenda), notice: "Produto was successfully updated." }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1 or /produtos/1.json
  def destroy
    @encomenda = Encomenda.find(params[:encomenda_id])
    @produto = @encomenda.produtos.find(params[:id])

    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: "Produto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def produto_params
      params.require(:produto).permit(:nome)
    end
end
