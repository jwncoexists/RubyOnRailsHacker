class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments

    @comment = current_user.comments.build(comment_params)
    @comment.blog = @blog
    # @new_comment = Comment.new
    
    authorize! :create, @comment, message: "You need be signed in to do that."

    if !@comment.save
      flash[:error] = "There was an error saving the comment. Please try again."
    end
      respond_with(@comment) do |f|
      f.html { redirect_to [@blog] }
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])

    @comment = @blog.comments.find(params[:id])
    authorize! :destroy, @comment, message: "You need to own the comment to delete it."

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@blog] }
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:id, :body, :user_id, :blog_id, :created_at, :updated_at )
    end

end
