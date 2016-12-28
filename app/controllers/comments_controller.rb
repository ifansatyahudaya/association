class CommentsController < ApplicationController
  before_action :set_commentable, only: [:index, :new, :create]

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      # redirect_to [User.find(1), @commentable], notice: "Comment created."
      redirect_to root_url, notice: "Comment created"
    else
      render :new
    end
  end

  private
    def find_commentable
      if params[:user_id]
        User.find(params[:user_id])
      elsif params[:product_id]
        Product.find(params[:product_id])
      end
    end

    def set_commentable
      @commentable = find_commentable
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end