class CommentsController < ApplicationController
  before_action :set_post
  allow_unauthenticated_access only: %i[ create ]

  def create
    comment = @post.comments.create! params.require(:comment).permit(:content)
    CommentsMailer.submitted(comment).deliver_later
    redirect_to @post
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end
