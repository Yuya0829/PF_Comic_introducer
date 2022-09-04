class Public::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "User was successfully updated."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  def unsubscribe
    if current_user
      @user = current_user
    elsif admin_signed_in?
      @user = User.find(params[:user_id])
    end
  end

  def withdraw
    if current_user
      @user = current_user
      @user.update(is_deleted: true)
      @user.favorites.destroy_all
      @user.post_comments.destroy_all
      @user.post_images.destroy_all
      reset_session
      redirect_to "/"
    elsif admin_signed_in?
      @user = User.find(params[:user_id])
      @user.update(is_deleted: true)
      redirect_to admin_users_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
