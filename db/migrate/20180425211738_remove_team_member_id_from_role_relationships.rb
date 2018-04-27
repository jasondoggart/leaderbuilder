class RemoveTeamMemberIdFromRoleRelationships < ActiveRecord::Migration[5.1]
  def change
    remove_column :role_relationships, :team_member_id, :integer
  end
end
