class CreateProductShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :product_shoppings do |t|

      t.timestamps
      t.integer :quantity
      t.references :product, null:false, foreign_key: true
      t.references :cart, null:false, foreign_key: true
    end
  end
end
