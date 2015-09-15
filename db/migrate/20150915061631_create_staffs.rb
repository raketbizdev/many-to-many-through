class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :full_name
      t.string :position

      t.timestamps null: false
    end
  end
end
