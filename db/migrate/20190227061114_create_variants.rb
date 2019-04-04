class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.integer :quantity
      t.integer :variant_id
      t.string :title
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
