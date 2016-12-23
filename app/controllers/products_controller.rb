class ProductsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @product = @user.products.new
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new(product_params)

    if @product.save
      redirect_to user_url(@user.id), notice: "Product successfully created"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])

    if @product.update(product_params)
      redirect_to user_url(@user.id), notice: "Product successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @product = @user.products.find(params[:id])
    @product.destroy

    redirect_to user_url(@user.id), alert: 'User successfully destroyed'
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :description)
    end
end
