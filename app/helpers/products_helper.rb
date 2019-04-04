module ProductsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.permit(:sort, :direction).merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def get_autocomplete_data(products)
    autocomeplete_data = []
    products.each{ 
      |product|
        product.slice! "The "
        autocomeplete_data.push({:value => product.downcase, :label => product})
    }
    return autocomeplete_data.to_json
  end

  def bulk_update_quantities(variant_ids, quantities)
    variant_ids.each_with_index do |var_id, index|
      begin
        variant = Variant.find_by(variant_id: var_id)
        variant.update!(quantity: quantities[index])
        binding.pry
        item =ShopifyAPI::InventoryLevel.find(:all, params: {:inventory_item_ids => variant.inventory_item_id}).first
        item.set(variant.quantity)
      rescue Exception => e
        puts "e: #{e.inspect}"
        next
      end
    end
  end
end
