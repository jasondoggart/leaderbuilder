class ApprenticeRelationshipsController < ApplicationController

  def new
    @role = Role.find(params[:role])
    @apprentice_relationship = ApprenticeRelationship.new
    @users = User.all
  end

  def create
    @users = User.all
    @apprentice_relationship = ApprenticeRelationship.new(
      apprentice_relationship_params
    )
    if @apprentice_relationship.save
      flash[:success] = 'Apprentice added'
      redirect_to role_path(@apprentice_relationship.role)
    else
      render :new
    end
  end

  protected

  def apprentice_relationship_params
    params.require(:apprentice_relationship).permit(:role_id, :apprentice_id)
  end

end
