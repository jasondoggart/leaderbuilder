class ChangeColumnFromRoleToLeadingRole < ActiveRecord::Migration[5.1]
  def change
    rename_column :role_relationships, :role_id, :leading_role_id
  end
end
