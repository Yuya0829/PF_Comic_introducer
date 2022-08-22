class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
