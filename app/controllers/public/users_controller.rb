class Public::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
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
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to "/"
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
