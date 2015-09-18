class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      	t.belongs_to :client, index: true 
		t.belongs_to :staff, index: true

      t.timestamps null: false
    end
  end
end
