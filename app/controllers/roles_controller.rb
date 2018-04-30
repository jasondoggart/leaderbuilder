class RolesController < ApplicationController
  before_action :require_login
  before_action :set_users, only: [:new, :edit, :update]
  before_action :set_role_types, only: [:new, :create, :edit, :update]
  before_action :set_role, only: [:edit, :update, :show, :destroy]

  def new
    @role = Role.new
    @ministry = Ministry.find(params[:ministry])
  end

  def create
    @role = Role.new(role_params)
    @ministry = @role.ministry
    if @role.save
      flash[:success] = 'Role created'
      redirect_to ministry_path(@ministry)
    else
      render :new
    end
  end

  def edit
    @ministry = @role.ministry
  end

  def update
    @ministry = @role.ministry
    if @role.update(role_params)
      flash[:success] = 'Role updated'
      if params[:set_inactive]
        RoleRelationship.where(leading_role: @role).delete_all
        @role.set_inactive_at = Time.now
        @role.save
        redirect_to ministry_path(@ministry)
      else
        redirect_to role_path(@role)
      end
    else
      render :edit
    end
  end

  def show
    @followers = @role.followers
  end

  def destroy
    @ministry = @role.ministry
    @role.delete
    RoleRelationship.where(leading_role: @role).delete_all
    flash[:success] = 'Role was removed'
    redirect_to ministry_path(@ministry)
  end

  protected

  def set_users
    @users = User.all
  end

  def set_role_types
    @role_types = ['Coach', 'Team Leader', 'Team Member']
  end

  def role_params
    params.require(:role).permit(
      :name,
      :role_type,
      :team_member_id,
      :ministry_id,
      :active
    )
  end

  def set_role
    @role = Role.find(params[:id])
  end
end
