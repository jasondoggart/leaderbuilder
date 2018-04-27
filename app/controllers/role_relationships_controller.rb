class RoleRelationshipsController < ApplicationController

  def new
    @leading_role = Role.find(params[:leading_role])
    @ministry = @leading_role.ministry
    @role_relationship = RoleRelationship.new
    @followers = assign_followers(@leading_role.role_type)
  end

  def create
    @role_relationship = RoleRelationship.new(role_relationship_params)
    @leading_role = Role.find(params[:role_relationship][:leading_role_id])
    @ministry = @leading_role.ministry
    @followers = assign_followers(@leading_role.role_type)
    if @role_relationship.save
      flash[:success] = 'Linked a new role'
      redirect_to role_path(@leading_role)
    else
      render :new
    end
  end

  protected

  def assign_followers(leading_role_type)
    case leading_role_type
    when 'Director'
      @ministry.roles.where(role_type: 'Coach')
    when 'Coach'
      @ministry.roles.where(role_type: 'Team Leader')
    when 'Team Leader'
      @ministry.roles.where(role_type: 'Team Member')
    end
  end

  def role_relationship_params
    params.require(:role_relationship).permit(:leading_role_id,
                                              :following_role_id)
  end
end
