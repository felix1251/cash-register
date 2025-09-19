class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.decimal :base_price, null: false, precision: 10, scale: 2
      t.timestamps
    end

    add_index :products, :code, unique: true
  end
end
