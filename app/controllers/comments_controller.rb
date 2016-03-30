class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  def create
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: 'Comment was added.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_url(@post), notice: 'Comment was removed.' }
      format.json { head :no_content }
      format.js 
    end
  end
  private
  def set_post
    @post = Post.find(params[:post_id])
  end
  def set_comment
    @comment = @post.comments.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
