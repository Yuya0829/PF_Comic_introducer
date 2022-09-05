class Public::PostCommentsController < ApplicationController

  before_action :authenticate

  def create
    post_image = PostImage.find_by(id: params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
      post_comment = PostComment.find_by(id: params[:id])
      if post_comment.present?
        post_comment.destroy
      end
      redirect_to post_image_path(params[:post_image_id])
  end

  private
  
  def authenticate
    user_signed_in? || admin_signed_in?
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
