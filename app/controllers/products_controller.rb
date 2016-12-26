class ProductsController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:show, :update, :destroy]

  def new 
    @product = @user.products.new
  end

  def create
    @product = @user.products.new(product_params)

    if @product.save
      redirect_to user_url(@user.id), notice: "Product successfully created"
    else
      render :new
    end
  end

  def show; end

  def edit
    @product = @user.products.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to user_url(@product.user.id), notice: "Product successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to user_url(@product.user.id), alert: 'User successfully destroyed'
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :description)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
