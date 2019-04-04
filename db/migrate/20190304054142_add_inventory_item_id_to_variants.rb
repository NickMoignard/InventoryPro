class AddInventoryItemIdToVariants < ActiveRecord::Migration[5.2]
  def change
    add_column :variants, :inventory_item_id, :integer
  end
end
