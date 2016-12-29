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

  def create_comment_product
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)

    if @comment.save
      # redirect_to user_product_url(@product.user_id, @product), notice: "Comment created"
      redirect_to [@product.user, @product], notice: "Comment Created"
    else
      render :new
    end
  end

  def create_user_comment
    @user = User.find(params[:user_id])
    @comment = @user.comments.new(comment_params)

    if @comment.save
      redirect_to @user, notice: "Comment created"
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