class AddActiveStatusToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :active, :boolean
  end
end
