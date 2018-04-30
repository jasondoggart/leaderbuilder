class AddDefaultToActiveRoles < ActiveRecord::Migration[5.1]
  def change
    change_column :roles, :active, :boolean, :default => true
  end
end
