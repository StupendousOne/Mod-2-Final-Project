# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Housebathroom.destroy_all
Housebedroom.destroy_all
Housegarage.destroy_all
Houseother.destroy_all
Housekitchen.destroy_all
Bathroom.destroy_all
Bedroom.destroy_all
Garage.destroy_all
Kitchen.destroy_all
OtherRoom.destroy_all
RoomStyle.destroy_all
House.destroy_all


10.times do
    House.create!(user_id: User.all.sample.id)
end

styles = [
    {style: "modern", desc: "A modern theme",cost: rand(0.5..5.0), user_id: User.all.sample.id},
    {style: "contemporary", desc: "A contemporary theme",cost: rand(0.5..5.0), user_id: User.all.sample.id},
    {style: "minimalist", desc: "A minimalist theme",cost: rand(0.5..5.0), user_id: User.all.sample.id},
    {style: "industrial", desc: "A industrial theme",cost: rand(0.5..5.0), user_id: User.all.sample.id},
    {style: "scandanavian", desc: "A scandanavian theme",cost: rand(0.5..5.0), user_id: User.all.sample.id},
    {style: "traditional", desc: "A traditional theme",cost: rand(0.5..5.0), user_id: User.all.sample.id},
    {style: "transitional", desc: "A transitional theme",cost: rand(0.5..5.0), user_id: User.all.sample.id},
    {style: "mid-century modern", desc: "A mid-century modern theme",cost: rand(0.5..5.0), user_id: User.all.sample.id}
]

styles.each { |s|  RoomStyle.create(s) }

20.times do
    Bedroom.create!({size: rand(25..100), room_style_id: RoomStyle.all.sample.id, user_id: User.all.sample.id})
end

20.times do
    Bathroom.create({half: [true, false].sample, size: rand(25..100), room_style_id: RoomStyle.all.sample.id, user_id: User.all.sample.id})
end

20.times do
    Kitchen.create!({size: rand(25..100), room_style_id: RoomStyle.all.sample.id, user_id: User.all.sample.id})
end

20.times do
    Garage.create!({size: rand(25..100), room_style_id: RoomStyle.all.sample.id, user_id: User.all.sample.id})
end

other_room_type = [
    "Living Room",
    "Attic",
    "Office",
    "Basement",
    "Game Room",
    "Theatre"
]

20.times do
    OtherRoom.create!({size: rand(25..100), room_style_id: RoomStyle.all.sample.id, room_type: other_room_type.sample, user_id: User.all.sample.id})
end

20.times do
    Housebedroom.create!({house_id: House.all.sample.id, bedroom_id: Bedroom.all.sample.id})
    Housebathroom.create!({house_id: House.all.sample.id, bathroom_id: Bathroom.all.sample.id})
    Housekitchen.create!({house_id: House.all.sample.id, kitchen_id: Kitchen.all.sample.id})
    Housegarage.create!({house_id: House.all.sample.id, garage_id: Garage.all.sample.id})
    Houseother.create!({house_id: House.all.sample.id, other_room_id: OtherRoom.all.sample.id})
end