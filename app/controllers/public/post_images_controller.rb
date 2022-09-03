class Public::PostImagesController < ApplicationController

before_action :authenticate_user!, except: [:show, :index]

  def new
    @post_image = PostImage.new
    @genres = Genre.all
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
       flash[:notice] = "Comic was successfully created."
       redirect_to post_images_path
    else
       @genres = Genre.all
       render :new
    end
  end

  def index
    if params[:genre]
      @post_images = PostImage.where(genre_id: params[:genre]).page(params[:page]).per(8)
    elsif params[:keyword].present?
      @post_images = PostImage.where(comic_name: params[:keyword]).page(params[:page]).per(8)
    else
      @post_images = PostImage.page(params[:page]).per(8)
    end
    @genres = Genre.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if@post_image.user == current_user || admin_signed_in?
      render :edit
    else
      redirect_to post_images_path
    end
    @genres = Genre.all
  end

  def update
    @post_image = PostImage.find(params[:id])
    if@post_image.save
      flash[:notice] = "You have updated comic successfully."
      redirect_to post_image_path(@post_image.id)
    else
      @genres = Genre.all
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
    params.require(:post_image).permit(:comic_name, :image, :caption, :genre_id, :star, :keyword)
  end

end
