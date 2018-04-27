class AddFollowingRoleToRoleRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :role_relationships, :following_role_id, :integer
  end
end
