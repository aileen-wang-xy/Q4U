class CommentsController < ApplicationController
    # only member can post comments
    before_action :authorized
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:name, :comment))
        redirect_to post_path(@post)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
    end
    
    # only member can post comments
    def authorized
        redirect_to new_user_session_path unless logged_in?
    end

    def logged_in?
       
        !current_user.nil?
    end
end
