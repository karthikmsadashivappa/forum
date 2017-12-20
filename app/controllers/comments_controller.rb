class CommentsController < ApplicationController

	def create

		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.build(params[:comment].permit(:comment))


		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

end
