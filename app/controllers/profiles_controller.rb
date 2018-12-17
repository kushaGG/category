class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_profile, only:[:show, :edit, :update, :destroy]

  def new
  	@profile = Profile.new
  end

  def create
  	@profile = current_user.build_profile(profile_params)
  	if @profile.save
  		redirect_to profile_path(current_user.id)
  	else
  		render 'new'
  	end
  	
  end

  def show
  end

  def edit
  end

  def update
  	if @profile.update(profile_params)
  		redirect_to profile_path(current_user.id)
  	end
  end

  def destroy
  	@profile.destroy
  	redirect_to root_path
  end
  private
  def profile_params
    params.require(:profile).permit(:firtsname, :lastname, :age, :avatar)
  end
  def find_profile
  	@profile = Profile.find_by(params[:id])
  end
end
