class AddFollowingRoleToRoleRelationships < ActiveRecord::Migration[5.1]
  def change
    add_reference :role_relationships, :following_role, foreign_key: true
  end
end
