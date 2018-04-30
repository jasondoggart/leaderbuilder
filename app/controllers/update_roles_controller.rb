class UpdateRolesController < ApplicationController

  def show
    @role = Role.find(params[:role])
  end
end
