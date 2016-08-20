class Admin::UsersController < ApplicationController
  before_action :check_login
  before_action :check_admin
  
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)

    @user.admin = true if params[:make_admin] == "1"

    @user.save

    if @user.errors.any?
      render :new
    else
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.admin = true if params[:make_admin] == "1"

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user == current_user
      flash[:notice] = "You cannot delete yourself"
      redirect_to admin_users_index_path
    else
      @user.destroy 
      redirect_to admin_users_index_path
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end
end
