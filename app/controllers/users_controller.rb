class UsersController < ApplicationController

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @user = User.find(params[:id])
    @roles = @user.roles.paginate(:page => params[:page], :per_page => 15)
  end
end
