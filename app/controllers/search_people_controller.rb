class SearchPeopleController < ApplicationController

  def search
    users = FetchUsers.new(params[:last_name])
    @search_results = users.get_people
    @user = User.new
    respond_to do |format|
      format.js
    end
  end
end
