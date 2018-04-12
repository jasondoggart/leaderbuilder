class RolesController < ApplicationController
  before_action :set_users, only: [:new, :edit, :update]
  before_action :set_role_types, only: [:new, :create, :edit, :update]
  before_action :set_role, only: [:edit, :update, :show]

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
      redirect_to ministry_path(@ministry)
    else
      render :edit
    end
  end

  def show
  end

  protected

  def set_users
    @users = User.all
  end

  def set_role_types
    @role_types = ['Coach', 'Ministry Leader', 'Team Member']
  end

  def role_params
    params.require(:role).permit(
      :name,
      :role_type,
      :team_member_id,
      :ministry_id
    )
  end

  def set_role
    @role = Role.find(params[:id])
  end
end
