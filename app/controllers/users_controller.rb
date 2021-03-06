class UsersController < ApplicationController
  before_action :require_login

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @user = User.find(params[:id])
    @active_roles = @user.roles.where(active: true)
    @inactive_roles = @user.roles.where(active: false)
    @apprenticeships = @user.apprenticeships
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.base64(8)
    @users = User.all
    if @user.save
      respond_to do |format|
        format.js
      end
    else
      flash[:warning] = "Could not add user"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :pc_id)
  end

end
