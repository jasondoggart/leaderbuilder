class ChangeColumnNameFromMemberToTeamMember < ActiveRecord::Migration[5.1]
  def change
    rename_column :role_relationships, :member_id, :team_member_id
  end
end
