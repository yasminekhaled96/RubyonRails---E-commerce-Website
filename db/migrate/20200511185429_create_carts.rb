class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
    

      t.timestamps
      t.references :user, null:false, foreign_key: true
    end
  end
end