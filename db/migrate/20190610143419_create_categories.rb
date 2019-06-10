class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.references :main_category,         null:true, index: true
      t.references :sub_category,          null:true, index: true
      t.timestamps
    end
  end
end
