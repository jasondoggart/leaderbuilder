class CreateRoleRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :role_relationships do |t|
     t.references :role, foreign_key: true
      t.references :team_member, foreign_key: true

      t.timestamps
    end
  end
end
