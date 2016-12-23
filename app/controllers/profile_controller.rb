class ProfileController < ApplicationController
  before_action :set_profile, only: [:new, :show, :edit, :update, :destroy]

  def new
    @profile = @user.profile.new
  end

  def create
    @profile = @user.profile.new(profile_params)
    if @profile.save
      redirect_to root_url, notice: 'Your profile successfully created'
    else
      render :new
    end 
  end

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to root_url, notice: 'Your profile successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_url, alert: 'Your profile successfully destroyed'
  end

  private
    def set_profile
      @user = User.find(params[:user_id])
      @profile = @user.profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :religion, :gender, :boolean, :date_of_birth)
    end
end
