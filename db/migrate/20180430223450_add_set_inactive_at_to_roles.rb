class AddSetInactiveAtToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :set_inactive_at, :datetime
  end
end
