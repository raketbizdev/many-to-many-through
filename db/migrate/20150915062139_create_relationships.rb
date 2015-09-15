class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :staff_id
      t.string :client_id

      t.timestamps null: false
    end
  end
end
