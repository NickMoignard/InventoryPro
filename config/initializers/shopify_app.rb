ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV['API_KEY']
  config.secret = ENV['SECRET']
  config.scope = "read_products, read_orders, read_inventory, write_inventory, read_locations" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'orders/create', address: 'https://inventorypro.ngrok.io/webhooks/orders_create', format: 'json'},
  ]
end
