class CreateApprenticeRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :apprentice_relationships do |t|

      t.timestamps
    end
  end
end
