class OrdersCreateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    line_items = webhook['line_items']
    items_to_ship = []

    # Check that china is not shipping the products
    line_items.each do |i|
      if i['product_vendor'] = "Very Cool"
        items_to_ship.append(i)
      end
    end

    _hat = false
    _large = 0
    _very_large = 0
    _small = 0
    
    items_to_ship.each do |i|
      item = Product.find_by(name: i['title'])
      size = ProductSize.find( item.product_size_id )
  
      size_name = size.name
  
      case size_name
      when 'Very Small'
        continue
      when 'Small'
        _small += 1
      when 'Large'
        _large += 1
      when 'Very Large'
        _very_large += 1
      when 'Hat'
        _hat = true
      end

      small_bag = Stock.find_by(name: 'Small Bag')
      large_bag = Stock.find_by(name: 'Large Bag')
      small_box = Stock.find_by(name: 'Small Box')
      large_box = Stock.find_by(name: 'Large Box')
      poster = Stock.find_by(name: 'Poster')
      
      if _large > 1 || _very_large.positive?  # 2 or more large items or one very large
        if _hat && _small < 4
          small_box.update!(quantity: small_box.quantity - 1)
        elsif _hat
          large_box.update!(quantity: large_box.quantity - 1)
          large_bag.update!(quantity: large_bag.quantity - 1)
        end
        large_bag.update!(quantity: large_bag.quantity - 1)
      elsif _large.positive?  # one large item
        if _hat && _small > 3
          # large bag large box
          large_box.update!(quantity: large_box.quantity - 1)
          large_bag.update!(quantity: large_bag.quantity - 1)
        elsif _hat
          small_box.update!(quantity: small_box.quantity - 1)
          large_bag.update!(quantity: large_bag.quantity - 1)
        elsif _small < 4 # one large item and 3 smaller can fit inside a small bag
          small_bag.update!(quantity: small_bag.quantity - 1)
        else
          large_bag.update!(quantity: large_bag.quantity - 1)
        end
      else   # no large items
        if _hat && _small < 4
          small_bag.update!(quantity: small_bag.quantity - 1)
          small_box.update!(quantity: small_box.quantity - 1)
        elsif _hat # more than 4 small items
          large_box.update!(quantity: large_box.quantity - 1)
          large_bag.update!(quantity: large_bag.quantity - 1)
        elsif _small > 6 # more small items than can fit in a small bag
          large_bag.update!(quantity: large_bag.quantity - 1)
        else
          small_bag.update!(quantity: small_bag.quantity - 1)
        end
      end

      poster.update!(quantity: poster.quantity - 1)
      

  
    end







  end
end
