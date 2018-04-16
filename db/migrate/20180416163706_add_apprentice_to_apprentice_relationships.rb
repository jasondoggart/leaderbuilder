class AddApprenticeToApprenticeRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :apprentice_relationships, :apprentice, :integer
  end
end
