class FuncionariosController < ApplicationController
  before_action :logged_in_admin
  def index
    @funcionarios = Funcionario.all
  end

  def show
    @funcionario = Funcionario.all.where(id: params[:id]).first
  end

  def edit
  end

  def update
    respond_to do |format|
      if @funcionario.update(user_params)
        format.html { redirect_to @funcionario, notice: "Funcionario was successfully updated." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_index_path	, notice: "Funcionario apagado com sucesso." }
      format.json { head :no_content }
    end
  end

  def deletar
    @funcionario = Funcionario.where("id = ?", params[:id]).first
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to root_path(:notice =>"Funcionário deletado com sucesso")}
    end
  end

  private
    def funcionario_params
      params.require(:funcionario).permit(:nome, :password, :password_confirmation)
    end
  end

