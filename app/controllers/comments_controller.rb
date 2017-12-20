class CommentsController < ApplicationController

	def create

		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.build(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def update
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy	
		@post = Post.friendly.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)

	end

end
