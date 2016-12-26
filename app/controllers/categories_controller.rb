class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_url, notice: 'Category successfully created'
    else
      render :new
    end 
  end

  def show; end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to root_url, notice: 'Category successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_url, alert: 'Category successfully destroyed'
  end

  private
    def category_params
      params.require(:category).permit(:name, :email)
    end

    def set_user
      @category = Category.find(params[:id])
    end
end
