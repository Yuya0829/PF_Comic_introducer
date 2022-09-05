class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.where(is_deleted: false).page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
    @post_images = @user.post_images.page(params[:page]).per(6)
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
