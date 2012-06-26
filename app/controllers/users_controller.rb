class UsersController < ApplicationController
before_filter :signed_in_user
#before_filter :correct_user,   only: [:edit, :update]
before_filter :admin_user

  #def new
  #  if signed_in?
  #    flash[:alert] = "You already signed in!"
  #    redirect_to current_user
  #  else
  #    @user = User.new
  #  end
  #end
  
  #def create
  #  @user = User.new(params[:user])
  #  if @user.save
  #    sign_in @user
  #    flash[:success] = "Welcome to the Sample App!"      
  #    redirect_to @user
  #  else
  #    render 'new'
  #  end
  #end
  
  #def edit
  #  @user = current_user
  #  respond_to do |format|
  #    format.html 
  #    format.js
  #  end
  #end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
    else
      flash[:alert] = "Unsuccessful, maybe you did not fill up password and password_confirmation correctly."
    end
    redirect_back_or root_path
  end

  #def show
  #  @user = User.find_by_name(params[:name])
  #end

  #def destroy
  #  User.find(params[:id]).destroy
  #  flash[:success] = "User destroyed."
  #  redirect_to users_path
  #end

  #private     
  #  def correct_user
  #    @user = User.find_by_name(params[:name])
  #  redirect_to(root_path) unless current_user?(@user)
  #  end
end
