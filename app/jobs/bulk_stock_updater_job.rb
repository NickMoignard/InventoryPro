class BulkStockUpdaterJob < ApplicationJob
  queue_as :default


  # inlcude ShopifyApp::Localization
  # include ShopifyApp::LoginProtection
  # include ShopifyApp::EmbeddedApp
  #
  # :shopify_session

  def perform(shopify_session, variant_ids, quantities)
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
