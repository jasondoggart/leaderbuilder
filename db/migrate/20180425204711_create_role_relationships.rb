class CreateRoleRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :role_relationships do |t|
     t.references :role, foreign_key: true
      t.integer :team_member_id

      t.timestamps
    end
  end
end
