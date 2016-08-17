class Admin::UsersController < ApplicationController
  before_filter :check_admin
  
  def index
    @users = User.all
  end
end
