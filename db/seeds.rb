# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
	name: "お菓子",
	id:1
	)

Item.create!(
	name: "キャラメル", 
	price: 100, 
	genre_id: 1,
	id: 1
	)


EndUser.all.each do |user|
  user.cart_items.create!(
    amount: 3,
    item_id: 1
  )
end

Item.create!(
	name: "チーズケーキ", 
	price: 300, 
	genre_id: 1,
	id: 2
	)


EndUser.all.each do |user|
  user.cart_items.create!(
    amount: 2,
    item_id: 2
  )
end