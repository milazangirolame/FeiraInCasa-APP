# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Store.destroy_all
Product.destroy_all

user = User.new
user.email = "seller@email.com"
user.password = "123456"
user.save!

Store.create!(name: 'Loja da Mila Ziggy',
              address: 'Av. Brigadeiro Faria Lima 201',
              city: 'Sao Paulo',
              zipcode: '05426-100',
              opened_time: '08:00',
              closed_time: '20:00',
              days_of_week_opened: ['Mon-Fri'],
              delivery_product: true,
              maximum_distance_to_deliver_km: 10,
              user_id: user.id)
Store.create!(name: 'Loja do Kaue',
              address: 'R. Gonçalo Afonso 55',
              city: 'Sao Paulo',
              zipcode: '05436-100',
              opened_time: '07:00',
              closed_time: '19:00',
              days_of_week_opened: ['Sun-Sun'],
              delivery_product: false,
              maximum_distance_to_deliver_km: 8,
              user_id: user.id)
Store.create!(name: 'Loja do Rodrigo',
              address: 'R. Ferreira de Araújo 527',
              city: 'Sao Paulo',
              zipcode: '05428-001',
              opened_time:'10:00',
              closed_time: '21:00',
              days_of_week_opened: ['Tues-Thurs'],
              delivery_product: 'Cenoura',
              maximum_distance_to_deliver_km: 9, user_id: user.id)
Store.create!(name: 'Loja do Carlos',
              address: 'R. Vupabussu 305',
              city: 'Sao Paulo',
              zipcode: '05429-040',
              opened_time:'09:00',
              closed_time: '22:00',
              days_of_week_opened: ['Mon-Satur'],
              delivery_product: 'Kiwi',
              maximum_distance_to_deliver_km: 7,
              user_id: user.id)

#Product.create!(name:'Banana', category:'Frutas', price: 4, unity:10, store: Store.first)
#Product.create!(name:'Laranja', category:'Frutas', price: 5, unity: 10, store: Store.first)
#Product.create!(name:'Kiwi', category:'Frutas', price: 7, unity: 10, store: Store.first)
#Product.create!(name:'Morango', category:'Frutas', price: 8, unity: 10, store: Store.last)
#Product.create!(name:'Alface', category:'vegetable', price:9, unity: 10, store: Store.last)
#Product.create!(name:'Cenoura', category:'vegetable', price:10, unity: 10, store: Store.last)


