class AddProductSizeIdToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_size_id, :integer
  end
end
