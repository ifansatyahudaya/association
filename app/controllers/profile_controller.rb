class ProfileController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update]

  def new
    @profile = @user.build_profile
  end

  def create
    @profile = @user.build_profile(profile_params)
    if @profile.save
      redirect_to root_url, notice: "You've added a profile detail"
    else
      render :new
    end
  end

  def edit
    @profile = @user.profile
  end

  def update
    if @user.profile.update(profile_params)
      redirect_to user_url(@user), notice: "Your profile successfully updated"
    else
      render :edit
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :religion, :gender, :date_of_birth)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
