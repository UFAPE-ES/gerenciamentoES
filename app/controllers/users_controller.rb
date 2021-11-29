class UsersController < ApplicationController
  before_action :logged_in_user
  def index
    @users = User.all
  end

  def show
    @user = User.all.where(id: params[:id]).first
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Usuario was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_index_url, notice: "Usuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
    def user_params
      params.require(:user).permit(:nome, :password, :password_confirmation, :tipo)
    end
end