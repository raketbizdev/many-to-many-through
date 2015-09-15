class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :business_name

      t.timestamps null: false
    end
  end
end
