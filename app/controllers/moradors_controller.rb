class MoradorsController < ApplicationController
  before_action :set_morador, only: %i[ show edit update destroy ]

  # GET /moradors or /moradors.json
  def index
    @moradors = Morador.all
  end

  # GET /moradors/1 or /moradors/1.json
  def show
  end

  # GET /moradors/new
  def new
    @morador = Morador.new
  end

  # GET /moradors/1/edit
  def edit
  end

  # POST /moradors or /moradors.json
  def create
    @morador = Morador.new(morador_params)

    respond_to do |format|
      if @morador.save
        format.html { redirect_to @morador, notice: "Morador was successfully created." }
        format.json { render :show, status: :created, location: @morador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @morador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moradors/1 or /moradors/1.json
  def update
    respond_to do |format|
      if @morador.update(morador_params)
        format.html { redirect_to @morador, notice: "Morador was successfully updated." }
        format.json { render :show, status: :ok, location: @morador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @morador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moradors/1 or /moradors/1.json
  def destroy
    @morador.destroy
    respond_to do |format|
      format.html { redirect_to moradors_url, notice: "Morador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_morador
      @morador = Morador.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def morador_params
      params.require(:morador).permit(:nome, :cpf, :bloco, :casanum, :contato)
    end
end
