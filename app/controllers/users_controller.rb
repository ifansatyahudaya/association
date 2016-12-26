class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'User successfully created'
    else
      render :new
    end 
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_url, notice: 'User successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url, alert: 'User successfully destroyed'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
