class CreateProductSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_sizes do |t|
      t.string :size, null: false
      t.timestamps
    end
  end
end
