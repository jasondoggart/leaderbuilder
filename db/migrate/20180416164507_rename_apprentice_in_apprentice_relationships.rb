class RenameApprenticeInApprenticeRelationships < ActiveRecord::Migration[5.1]
  def change
    rename_column :apprentice_relationships, :apprentice, :apprentice_id
  end
end
