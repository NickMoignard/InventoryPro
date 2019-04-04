# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

items = [
    {
        name: 'Large Bag',
        quantity: 69
    },
    {
        name: 'Small Bag',
        quantity: 69
    },
    {
        name: 'Poster',
        quantity: 69
    },
    {
        name: 'Large Box',
        quantity: 69
    },
    {
        name: 'Small Box',
        quantity: 69
    }
]

stocks = Stock.create(items)

ProductSize.create(name: 'Large', collection_id: 123253260352)
ProductSize.create(name: 'Hat', collection_id: 123241824320)
ProductSize.create(name: 'Small', collection_id: 123253162048)
ProductSize.create(name: 'Very Small', collection_id: 123253555264)
ProductSize.create(name: 'Very Large', collection_id: 123253784640)