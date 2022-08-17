class Public::PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if@post_image.user == current_user
      render :edit
    else
      redirect_to post_images_path
    end
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    if@post_image.save
      flash[:notice] = "You have updated comic successfully."
      redirect_to post_image_path(@post_image.id)
    else
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:comic_name, :image, :caption)
  end

end