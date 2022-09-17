class Public::PostImagesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :new]
  before_action :authenticate_user_or_admin, only: [ :edit, :update, :destroy]

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
      @post_images = PostImage.page(params[:page]).per(8).order('created_at DESC')
    end
    @genres = Genre.all
  end

  def show
    @post_image = PostImage.find_by(id: params[:id])
    @post_comment = PostComment.new
    @post_comments = @post_image.post_comments.page(params[:page]).per(2)
  end

  def edit
    @post_image = PostImage.find_by(id: params[:id])
    if admin_signed_in? || (user_signed_in? && (@post_image.user_id == current_user.id))
      render :edit
    else
      redirect_to post_images_path
    end
    @genres = Genre.all
  end

  def update
    @post_image = PostImage.find_by(id: params[:id])
    if admin_signed_in? || (user_signed_in? && (@post_image.user_id == current_user.id))
      @post_image.update(post_image_params)
      flash[:notice] = "You have updated comic successfully."
      redirect_to post_image_path(@post_image.id)
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find_by(id: params[:id])
    if admin_signed_in? || (user_signed_in? && (@post_image.user_id == current_user.id))
      @post_image = PostImage.find_by(id: params[:id])
      @post_image.destroy
      redirect_to post_images_path
    else
      render :show
    end
  end


  private

  def post_image_params
    params.require(:post_image).permit(:comic_name, :image, :caption, :genre_id, :star, :keyword)
  end

end
