class CreateProductsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :products_tags do |t|
      t.integer :product_id, :index
      t.integer :tag_id
    end

    add_index :products_tags, :product_id
    add_index :products_tags, :tag_id
  end
end
